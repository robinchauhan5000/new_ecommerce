import 'package:flutter/material.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

class VerifyOtpRepo extends BaseRepository{

  Future<LoginEntity> loginUser(
      String mobile,
      String code,
      BuildContext context,
      ) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.otp,
        context: context,
        headers: {'content-type':'application/json'},
        data: {
          "user_registration_mobile_number" : mobile,
          "code" : code,
        });
    try {
      if (apiResponse.status) {
        final passEntity = LoginEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return LoginEntity(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}