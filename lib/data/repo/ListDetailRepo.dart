import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';
import 'package:flutter_ecommerce/models/ListDetail.dart';

class ListDetailRepo extends BaseRepository
{
  Future<ListDetail> getlistdetail(
      {String listId}) async {
    final uri = '${ApiEndpoint.BaseUrl}/list/byId/${listId}';
    var response = await Dio().get(uri,
        options: Options(
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = ListDetail.fromJson(response.data);
        return passEntity;
      } else {
        return ListDetail(message: response.statusMessage);
      }
    } catch (error, stacktrace) {}
  }
}
