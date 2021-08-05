import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

import '../../base/BaseRepository.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';

class GoogleUserRepo extends BaseRepository {
  Future<LoginEntity> googlelogin(
      String email, String image, BuildContext context,
      {String userToken}) async {
    print(image);
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.google, context: context, headers: {
      'content-type': 'application/json'
    }, data: {
      "user_registration_email": email,
      "registration_type": "google",
      "user_profile_image": image,
      "token": "hdsg"
    });
    try {
      if (apiResponse.status) {
        final passEntity = LoginEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return LoginEntity(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {
      print(error);
    }
  }
}
