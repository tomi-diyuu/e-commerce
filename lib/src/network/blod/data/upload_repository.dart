import 'package:e_commerce/src/network/blod/model/upload_model.dart';
import 'package:e_commerce/src/network/model/common/result.dart';

abstract class UploadRepository {
  Future<MResult<MUpload?>> uploadImage(String path);
  Future<MResult<MUpload?>> uploadVideo(String path);
  Future<List<MResult<MUpload>>> uploadVideos(List<String> paths);
  Future<List<MResult<MUpload>>> uploadImages(List<String> paths);
}
