
import 'package:dio/dio.dart';
import 'package:londonair/src/constants/Credentials.dart';
import 'package:londonair/src/constants/constants.dart';

class DioClient {

  static final String _baseUrl = "https://newsapi.org/";
  Dio _client;

  DioClient() {
    this._client = new Dio(_dioOption());
  }

  BaseOptions _dioOption() {
    BaseOptions options = new BaseOptions(baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      queryParameters: { "apiKey": Credentials.APIKEY, "pageSize": kPageSize }
    );
    return options;
  }

  Dio get client => _client;

}