import 'package:flutter/cupertino.dart';

import '../../base/BaseRepository.dart';
import '../../models/ForgotPasswordEntity.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';

class ResendOtpRepo extends BaseRepository{

  Future<ForgotPasswordEntity> resendotp(
      String mobile, BuildContext context
      ) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.resendOtp,
    headers: {'content-type' : 'application/json'},
        context: context,
    data: {
      "user_registration_mobile_number" : mobile
    });
    try {
      if (apiResponse.status) {
        final passEntity =
        ForgotPasswordEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return ForgotPasswordEntity(errors: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}