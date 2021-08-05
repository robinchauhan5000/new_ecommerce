import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/data/api/ApiEndPoint.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';

class GetLoginUser extends BaseRepository {
  Future<GetLoginUserEntity> getUser({String email}) async {
    final uri = '${ApiEndpoint.BaseUrl}userProfile/$email';
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
    } catch (error, stacktrace) {
      print(error);
    }
  }
}
