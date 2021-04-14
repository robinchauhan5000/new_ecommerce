import 'package:flutter/material.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

class UpdatePasswordRepo extends BaseRepository{

  Future<LoginEntity> updatePassword(String password,
      BuildContext context,String mobile,
      {String userToken}) async {
    print(ApiEndpoint.updatePassword+"$mobile");

    ApiResponse apiResponse = await apiHitter.getPutApiResponse(ApiEndpoint.updatePassword+"$mobile",
        context: context,
        data: {
          "user_registration_password" : password,
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