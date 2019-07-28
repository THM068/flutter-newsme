
import 'package:get_it/get_it.dart';
import 'package:londonair/src/services/dio_client.dart';

import 'book_mark_service.dart';
import 'news_api_service.dart';

GetIt sl = new GetIt();

void setup() {
  sl.registerSingleton(NewsApiService(DioClient()));

  sl.registerSingleton(BookMarkService());
}