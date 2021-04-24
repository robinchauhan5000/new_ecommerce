import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';
import 'package:flutter_ecommerce/models/ListDetail.dart';
import 'package:flutter_ecommerce/models/CartEntity.dart';

class UserCartRepo extends BaseRepository
{
  Future<CartEntity> usercart(
      {String listId}) async {
    final uri = '${ApiEndpoint.BaseUrl}addTocart/byUserId/${listId}';
    var response = await Dio().get(uri,
        options: Options(
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = CartEntity.fromJson(response.data);
        return passEntity;
      } else {
        return CartEntity(message: response.statusMessage);
      }
    } catch (error, stacktrace) {}
  }
}
