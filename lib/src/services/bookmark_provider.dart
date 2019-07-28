import 'package:flutter/foundation.dart';
import 'package:londonair/src/services/service_locator.dart';

import 'book_mark_service.dart';

class BookMarkProvider extends ChangeNotifier {

  final BookMarkService bookMarkService = sl.get<BookMarkService>();
}