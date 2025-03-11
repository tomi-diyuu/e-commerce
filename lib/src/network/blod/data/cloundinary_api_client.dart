import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/src/network/blod/model/upload_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'cloundinary_api_client.g.dart';

@RestApi(baseUrl: "https://api.cloudinary.com/v1_1/")
abstract class CloundinaryApiClient {
  factory CloundinaryApiClient(Dio dio, {String baseUrl}) =
      _CloundinaryApiClient;

  @POST("{cloudName}/upload")
  @MultiPart()
  Future<MUpload> uploadImage(
    @Path("cloudName") String cloudName,
    @Part(name: "file") File file,
    @Part(name: "upload_preset") String uploadPreset,
  );
}
