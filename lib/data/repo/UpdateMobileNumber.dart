import 'package:flutter/material.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

class UpdateMobileRepo extends BaseRepository{

  Future<LoginEntity> updatemobile(
      BuildContext context,String mobile,String email,
      {String userToken}) async {

    ApiResponse apiResponse = await apiHitter.getPutApiResponse(ApiEndpoint.updatemobile+"$email",
        context: context,
        data: {
          "user_registration_mobile_number" : mobile,
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