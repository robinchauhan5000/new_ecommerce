import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/UpdateProfileEntity.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';
import 'dart:io';
import 'package:dio/dio.dart';
class UpdateProfileRepo extends BaseRepository{

  Future<UpdateProfileEntity> updateProfile(String userName,
      String userProfileImage,
      String email,
      File profileImage, String id,
      BuildContext context,
      {String userToken}) async {
    if (profileImage != null && profileImage != "")
      {
        var filename = profileImage.path.split('/').last;
        if (!filename.contains(".")) {
          filename = filename + ".jpg";
        }
        userProfileImage = "https://shoppinglist.sellatomy.com:3000/uploads/$filename";
      }

    FormData formData = new FormData.fromMap({
      "user_name":userName,
      "user_profile_image":userProfileImage,
      "user_email":email,
    });

    if (profileImage != null && profileImage != "") {
      var filename = profileImage.path.split('/').last;
      if (!filename.contains(".")) {
        filename = filename + ".jpg";
      }
      formData.files.add(MapEntry("profile_image",
          await MultipartFile.fromFile(profileImage.path, filename: filename)));
    }
    ApiResponse apiResponse = await apiHitter.getPutApiResponse(ApiEndpoint.updateProfile+id,
        context: context,
        isformdata: true,formdata: formData);
    try {
      if (apiResponse.status) {
        final passEntity = UpdateProfileEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return UpdateProfileEntity(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}