import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';


class CartListRepo extends BaseRepository
{
  Future<CartListEntity> cartListing(
      {String listId}) async {
    final uri = '${ApiEndpoint.BaseUrl}list/byUserId/${listId}';
    var response = await Dio().get(uri,
        options: Options(
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = CartListEntity.fromJson(response.data);
        return passEntity;
      } else {
        return CartListEntity(message: response.statusMessage);
      }
    } catch (error, stacktrace) {}
  }
}
