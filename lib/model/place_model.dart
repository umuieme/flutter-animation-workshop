class PlaceModel {
  final String name;
  final String time;
  final String distance;
  final String description;
  final int likes;
  final int commentCount;
  final int starCount;
  final int shareCount;
  final String mainImage;
  final List<String> topUsers;
  final List<String> imageList;
  final String destinationName;
  PlaceModel(
      {this.name,
      this.time,
      this.distance,
      this.description,
      this.likes = 0,
      this.mainImage,
      this.imageList,
      this.commentCount = 5,
      this.starCount = 0,
      this.shareCount = 0,
      this.topUsers,
      this.destinationName});

  static PlaceModel getDummyPlace() {
    return PlaceModel(
        name: "Maldives Tour",
        time: "30 days",
        distance: "862 KM",
        description:
            "One of the largest artificial island itn the world, it is also easily accessbible by monorail, which runs down a treetrunk to connect the mainland's rail system",
        likes: 209,
        mainImage: 'assets/maldives_main.jpeg',
      destinationName: "Maldives",
        imageList: [
          'assets/maldives_main.jpeg',
          'assets/maldives_main.jpeg',
          'assets/maldives_main.jpeg',
          'assets/maldives_main.jpeg',
          'assets/maldives_main.jpeg'
        ],
        topUsers: [
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png'
        ]);
  }
}
