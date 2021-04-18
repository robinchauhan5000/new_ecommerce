import 'package:flutter/material.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';
import 'package:flutter_ecommerce/models/AddedItems.dart';
class CreateListRepo extends BaseRepository{

  Future<LoginEntity> getlist(String cost,List<Additems> items,
      String userId,String itemcount,
      BuildContext context,
      {String userToken}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.list,
        context: context,
        headers: {'content-type':'application/json'},
        data: {
          "shoppingLstName" : "Yearly List",
          "addedProducts": items,
          "totalItems" : itemcount,
          "totalCost" : "\$"+cost,
          "userId" : userId

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