class PlaceModel {
  final String name;
  final String time;
  final String distance;
  final String description;
  final int likes;
  final String mainImage;
  final List<String> imageList;

  PlaceModel(this.name, this.time, this.distance, this.description, this.likes, this.mainImage,
      this.imageList);

  static PlaceModel getDummyPlace() {
    return PlaceModel(
        "Maldives Tour",
        "30 days",
        "862 KM",
        "One of the largest artificial island itn the world, it is also easily accessbible by monorail, which runs down a treetrunk to connect the mainland's rail system",
        209, 'assets/maldives_main.jpeg', ['assets/maldives_main.jpeg','assets/maldives_main.jpeg','assets/maldives_main.jpeg','assets/maldives_main.jpeg','assets/maldives_main.jpeg']);
  }
}
