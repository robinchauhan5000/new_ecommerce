import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/UserListCreatedEntity.dart';


class CartListRepo extends BaseRepository {
  Future<UserCreatedListEntity> cartListing(
      {String userId}) async {
    final uri = '${ApiEndpoint.BaseUrl}/byUserId/${userId}';
    var response = await Dio().get(uri,
        options: Options(
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = UserCreatedListEntity.fromJson(response.data);
        return passEntity;
      } else {
        return UserCreatedListEntity(message: response.statusMessage);
      }
    } catch (error, stacktrace) {}
  }
}
