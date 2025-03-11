import 'package:e_commerce/src/network/data/sign/sign_repository.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/error_code.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/social_user/social_user.dart';
import 'package:e_commerce/src/network/model/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignRepositoryImpl extends SignRepository {
  @override
  Future<MResult<MUser>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var data =
          await DomainManager().user.getOrAddUser(MUser(id: user.user!.uid));
      return MResult.success(data.data);
    } on FirebaseAuthException catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult> logout() async {
    await FirebaseAuth.instance.signOut();
    return MResult.success("success");
  }

  @override
  Future<MResult<MUser>> signUpWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var data = MUser(
        email: email,
        name: name,
        id: user.user?.uid ?? "",
      );
      // connect with backend
      await DomainManager()
          .user
          .getOrAddUser(data); // Thêm người dùng vào database

      await DomainManager().cart.getOrAddCart(data.id);
      return MResult.success(data);
    } on FirebaseAuthException catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MSocialUser>> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final bool isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        await googleSignIn.signOut();
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      if (googleUser != null && googleAuth != null) {
        return MResult.success(
            MSocialUser.fromGoogleAccount(googleUser, googleAuth));
      } else {
        return MResult.error(MErrorCode.unknown);
      }
    } catch (e) {
      return MResult.error(MErrorCode.unknown);
    }
  }

  @override
  Future<MResult<MUser>> connectBEWithGoogle(MSocialUser user) async {
    try {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: user.accessToken, idToken: user.idToken);
      // Once signed in, return the UserCredential
      final UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final firebaseUser = result.user;

      final newUser = MUser(
          id: firebaseUser?.uid ?? '',
          email: user.email,
          name: user.fullName,
          avatar: user.avatar);
      final userResult = await DomainManager().user.getOrAddUser(newUser);

      if (userResult.isSuccess) {
        await DomainManager().cart.getOrAddCart(userResult.data!.id);
      }

      return MResult.success(userResult.data ?? newUser);
      // return MResult.success(newUser);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
