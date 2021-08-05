import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/base/BaseRepository.dart';
import 'package:flutter_ecommerce/models/ListDetail.dart';

class ListDetailRepo extends BaseRepository {
  Future<ListDetail> getlistdetail({String listId}) async {
    print('dssdsddsddsd' + listId);
    final uri =
        'https://shoppinglist.sellatomy.com:3001/list/byId/60f6c66d62b92613020a9851';
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
    } catch (error, stacktrace) {
      print(error);
    }
  }
}
