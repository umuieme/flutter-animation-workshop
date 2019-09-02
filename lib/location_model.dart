import 'package:meta/meta.dart';

class Location {
  String name;
  bool isFavorite;
  double rating;
  String imageUrl;

  Location(
      {@required this.name,
      this.isFavorite = false,
      this.rating = 5,
      @required this.imageUrl,
      this.locationImages});

  List<String> locationImages;
}
