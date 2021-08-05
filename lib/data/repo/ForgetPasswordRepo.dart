import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

import '../../base/BaseRepository.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';

class ForgetPasswordRepo extends BaseRepository {
  Future<LoginEntity> forgetPassword(String mobileNo, BuildContext context,
      {String userToken}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
        ApiEndpoint.forgetPassword,
        context: context,
        data: {
          "user_registration_mobile_number": mobileNo,
        });
    try {
      if (apiResponse.status) {
        print(apiResponse.msg + apiResponse.status.toString());
        final passEntity = LoginEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return LoginEntity(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
