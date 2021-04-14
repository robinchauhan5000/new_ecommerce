import 'package:flutter/material.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';

class AddedCartItemsRepo extends BaseRepository{

  Future<LoginEntity> cartItems(List itemListId,
      String userId,
      BuildContext context,
      {String userToken}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.login,
        context: context,
        headers: {'content-type':'application/json'},
        data: {
          "itemListId" : itemListId,
          "userId" : userId,
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