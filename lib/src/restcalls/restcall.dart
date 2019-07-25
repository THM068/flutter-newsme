
abstract class Restcall {

  String resourcePath();

  Map<String, dynamic> getQueryParams() {
    return Map<String,dynamic>();
  }

  Map<String, dynamic> getHeaders() {
    return Map<String,dynamic>();;
  }
}