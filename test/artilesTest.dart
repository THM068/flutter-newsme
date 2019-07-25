import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:londonair/src/model/headlines.dart';
import 'package:londonair/src/services/dio_client.dart';
import "package:test/test.dart";

void main() {
  
  test("Articles can be created from json", () async {
    DioClient dioClient = DioClient();
    Response response =  await dioClient.client.get("v2/top-headlines?country=za&category=sport");
    print(response.data.keys);
    HeadLines headLines = HeadLines.fromJson(response.data);

    for( var article in headLines.articles) {
      print(article.urlToImage);
    }
//    Dio dio = new Dio();
//
//    Response response = await dio.get("https://api.tfl.gov.uk/StopPoint/490005183E/arrivals");
//
//    print(response.data.runtimeType.toString());
//
////    print(model["\$type"]);
//
//

  });



}


