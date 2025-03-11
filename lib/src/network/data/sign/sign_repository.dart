import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/social_user/social_user.dart';
import 'package:e_commerce/src/network/model/user/user.dart';

abstract class SignRepository {
  // Login with Email
  Future<MResult<MUser>> loginWithEmail(
      {required String email, required String password});

  Future<MResult<MUser>> signUpWithEmail(
      {required String email, required String password, required String name});

  Future<MResult> logout();

  Future<MResult<MUser>> forgotPassword(String email);

  Future<MResult<MSocialUser>> loginWithGoogle();

  Future<MResult<MUser>> connectBEWithGoogle(MSocialUser user);
}
