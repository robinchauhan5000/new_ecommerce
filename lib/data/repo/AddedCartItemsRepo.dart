import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/CreateList.dart';

import '../../base/BaseRepository.dart';
import '../api/ApiEndPoint.dart';
import '../api/ApiHitter.dart';

class AddedCartItemsRepo extends BaseRepository {
  Future<CreateList> cartItems(
      List<String> itemListId, String userId, BuildContext context,
      {String userToken}) async {
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.addTocart, context: context, headers: {
      'content-type': 'application/json'
    }, data: {
      "itemListId": itemListId,
      "userId": userId,
    });
    try {
      if (apiResponse.status) {
        final passEntity = CreateList.fromJson(apiResponse.response.data);
        print(passEntity.docs.sId);
        return passEntity;
      } else {
        return CreateList(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
