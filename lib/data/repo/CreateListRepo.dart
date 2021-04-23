import 'package:flutter/material.dart';
import '../../base/BaseRepository.dart';
import '../../models/UserData.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';
import 'package:flutter_ecommerce/models/AddedItems.dart';
import 'package:flutter_ecommerce/models/CreateList.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class CreateListRepo extends BaseRepository{

  Future<CreateList> addlist(String cost,List<Additems> items,
      String userId,String itemcount,String listname,
      BuildContext context,
      {String userToken}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(ApiEndpoint.list,
        context: context,
        headers: {'content-type':'application/json'},
        data: {
          "shoppingLstName" : listname,
          "addedProducts": json.decode(json.encode(items)),
          "totalItems" : itemcount,
          "totalCost" : "\$"+cost,
          "userId" : userId
        });
    try {
      if (apiResponse.status) {
        final passEntity = CreateList.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return CreateList(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}