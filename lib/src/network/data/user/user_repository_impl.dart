import 'package:e_commerce/src/network/data/user/user_reference.dart';
import 'package:e_commerce/src/network/data/user/user_repository.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/user/user.dart';

class UserRepositoryImpl extends UserRepository {
  final usersRef = UserReference();
  @override
  Future<MResult<MUser>> getOrAddUser(MUser user) {
    return usersRef.getOrAddUser(user);
  }

  @override
  Future<MResult<MUser>> getUser(String id) async {
    return await usersRef.get(id);
  }

  @override
  Future<MResult<List<MUser>>> getUsets() {
    return usersRef.getUsers();
  }

  @override
  Future<MResult<MUser>> updateUser(MUser user) {
    return usersRef.updateUser(user);
  }
}
