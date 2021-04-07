import 'package:flutter/material.dart';

import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';

class SignUpUserRepo extends BaseRepository{
  Future<UserDataEntity> signUpUser(
    String email,{String password,
        BuildContext context,
        String name,String confirmPassword}
      ) async{
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.userRegister,
    headers: {'content-type' : 'application/json'},
        context: context,
    data: {
      "email": email,
      "password": password,
      "name" :name,
      "c_password" :confirmPassword
    });
    try {
      if (apiResponse.status) {
        final passEntity = UserDataEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else
      {
        return UserDataEntity(errors: apiResponse.msg);
      }
    }
    catch (error, stacktrace)
    {

    }
  }
}