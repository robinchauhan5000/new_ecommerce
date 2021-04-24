import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/ProductListingEntity.dart';

class ProductListingRepo extends BaseRepository {
  Future<List<ProductListingEntity>> listing(
      {String token, String userId, String friendId}) async {
    final uri = '${ApiEndpoint.BaseUrl}product/filter';
    var response = await Dio().get(uri);

    try {
      if (response.data != null) {
        final parsed = response.data.cast<Map<String, dynamic>>();
        List<ProductListingEntity> productList = parsed.map<ProductListingEntity>((json) => ProductListingEntity.fromJson(json)).toList();
        return productList;
      }
    } catch (error) {
      print(error);
    }

  }
}
