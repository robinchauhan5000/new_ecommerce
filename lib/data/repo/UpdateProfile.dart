import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/UpdateProfileEntity.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

class UpdateProfileRepo extends BaseRepository{

  Future<UpdateProfileEntity> updateProfile(String userName,
      String userProfileImage,
      String email,
      String profileImage, String id,
      BuildContext context,
      {String userToken}) async {
    ApiResponse apiResponse = await apiHitter.getPutApiResponse(ApiEndpoint.updateProfile,
        context: context,
        data: {
        "user_name":userName,
        "user_profile_image":userProfileImage,
        "user_email":email,
        "profile_image":profileImage,
        "id":id
        });
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