import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce/src/network/blod/data/cloundinary_api_client.dart';
import 'package:e_commerce/src/network/blod/data/upload_repository.dart';
import 'package:e_commerce/src/network/blod/model/upload_model.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UploadRepositoryImpl extends UploadRepository {
  final CloundinaryApiClient _apiClient;

  UploadRepositoryImpl() : _apiClient = CloundinaryApiClient(Dio());

  Future<MUpload> uploadFile(String path) async {
    try {
      File file = File(path);
      String uploadPreset = dotenv.env["UPLOAD_PRESET"]!;
      String cloundName = dotenv.env["CLOUND_NAME"]!;

      final response =
          await _apiClient.uploadImage(cloundName, file, uploadPreset);

      return response;
    } catch (e) {
      return MUpload(url: "");
    }
  }

  @override
  Future<MResult<MUpload?>> uploadImage(String path) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

  @override
  Future<List<MResult<MUpload>>> uploadImages(List<String> paths) {
    // TODO: implement uploadImages
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUpload?>> uploadVideo(String path) {
    // TODO: implement uploadVideo
    throw UnimplementedError();
  }

  @override
  Future<List<MResult<MUpload>>> uploadVideos(List<String> paths) {
    // TODO: implement uploadVideos
    throw UnimplementedError();
  }
}
