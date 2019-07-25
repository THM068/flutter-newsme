
class Source {

  final String id;
  final String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Source( id: parsedJson['id'], name: parsedJson['name']);
  }


}