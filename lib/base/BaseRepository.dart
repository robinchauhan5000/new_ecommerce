

import 'package:flutter_ecommerce/data/api/ApiHitter.dart';

class BaseRepository {
  final apiHitter = ApiHitter();
  final dio = ApiHitter.getDio();
}