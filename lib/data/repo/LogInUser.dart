import 'package:flutter/material.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';

class LoginUserRepo extends BaseRepository{

  Future<UserDataEntity> loginUser(String email,
      String password,
      String userType,
  BuildContext context,
  {String userToken}) async {
  ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.login,
  context: context,
    headers: {'content-type':'application/json'},
    data: {
    "email" : email,
      "password" : password,
    });
  try {
    if (apiResponse.status) {
      final passEntity = UserDataEntity.fromJson(apiResponse.response.data);
      return passEntity;
    } else {
      return UserDataEntity(errors: apiResponse.msg);
    }
  } catch (error, stacktrace) {}
  }
}