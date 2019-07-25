import 'dart:async';
import 'package:dio/dio.dart';
import 'package:londonair/src/model/headlines.dart';
import 'package:londonair/src/restcalls/top_headlines_restCall.dart';
import 'dio_client.dart';

class NewsApiService {

  DioClient _dioClient;
  
  NewsApiService(DioClient dioClient) {
    this._dioClient = dioClient;
  }
  
  Future<HeadLines> getTopHeadlines({String country="gb"}) async {
    TopHeadLinesRestCall topHeadLinesRestCall = new TopHeadLinesRestCall(country: country);
    Response response = await _dioClient.client.get(topHeadLinesRestCall.resourcePath());
    HeadLines headLines = HeadLines.fromJson(response.data);
    return headLines;
  }

}