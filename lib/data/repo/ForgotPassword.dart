import 'package:flutter/cupertino.dart';

import '../../base/BaseRepository.dart';
import '../../models/ForgotPasswordEntity.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';

class ForgotPasswordRepo extends BaseRepository{

  Future<ForgotPasswordEntity> forgotPassword(
      String email, BuildContext context
      ) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.forgetpwd,
    headers: {'content-type' : 'application/json'},
        context: context,
    data: {
      "email" : email
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