
import 'package:londonair/src/restcalls/restcall.dart';

class TopHeadLinesRestCall extends Restcall {

  final String country;

  TopHeadLinesRestCall({this.country});

  @override
  String resourcePath() {
    return "v2/top-headlines?country=${this.country}";
  }




}