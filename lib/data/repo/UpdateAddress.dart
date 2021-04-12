import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/UpdateProfileEntity.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

class UpdateAddress extends BaseRepository{

  Future<UpdateProfileEntity> updateAddress(String userAddress,
      String userState,
      String userCountry,
      String userZipCode, String id,
      BuildContext context,
      {String userToken}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.updateAddress,
        context: context,
        data: {
        "user_address":userAddress,
        "user_state":userState,
        "user_country":userCountry,
        "user_zip_code":userZipCode,
          "id":id
        });
    try {
      if (apiResponse.status) {
        final passEntity = UpdateProfileEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return UpdateProfileEntity(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}