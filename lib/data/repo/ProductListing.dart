import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/ProductListingEntity.dart';


class ProductListingRepo extends BaseRepository {
  Future<ProductListingEntity> listing(
      {String token, String userId, String friendId}) async {
    final uri = '${ApiEndpoint.BaseUrl}product';
    var response = await Dio().get(uri,
        options: Options(
        /*  headers: {'Authorization': 'Bearer ${token}'},*/
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = ProductListingEntity.fromJson(response.data);
        return passEntity;
      } else {
        return ProductListingEntity(/*message: response.statusMessage*/);
      }
    } catch (error, stacktrace) {}
  }
}
