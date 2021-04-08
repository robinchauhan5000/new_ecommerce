import 'package:flutter/material.dart';

import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/RegisterEntity.dart';

class SignUpUserRepo extends BaseRepository{
  Future<RegisterEntity> signUpUser(BuildContext context,
    String email,String name,String pwd,String mobile,String zip,String country,String type
      ) async{
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.userRegister,
    headers: {'content-type' : 'application/json'},
        context: context,
    data: {
      "user_registration_email": email,
      "user_registration_name": name,
      "user_registration_password" :pwd,
      "user_registration_mobile_number" :mobile,
      "user_registration_zip_code" :zip,
      "user_registration_country" :country,
      "registration_type" :type,
    });
    try {
      if (apiResponse.status) {
        final passEntity = RegisterEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else
      {
        return RegisterEntity(message: apiResponse.msg);
      }
    }
    catch (error, stacktrace)
    {

    }
  }
}