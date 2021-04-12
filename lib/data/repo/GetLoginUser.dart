import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/models/ProductListingEntity.dart';


class GetLoginUser extends BaseRepository {
  Future<GetLoginUserEntity> getUser(
      {String token, String userId, String friendId}) async {
    final uri = '${ApiEndpoint.BaseUrl}userProfile/:user_email';
    var response = await Dio().get(uri,
        options: Options(
          /*  headers: {'Authorization': 'Bearer ${token}'},*/
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = GetLoginUserEntity.fromJson(response.data);
        return passEntity;
      } else {
        return GetLoginUserEntity(message: response.statusMessage);
      }
    } catch (error, stacktrace) {}
  }
}
