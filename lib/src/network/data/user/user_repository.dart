import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/user/user.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser(String id);
  Future<MResult<MUser>> getOrAddUser(MUser user);
  Future<MResult<MUser>> updateUser(MUser user);
  Future<MResult<List<MUser>>> getUsets();
}
