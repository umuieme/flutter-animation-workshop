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
  final double rating;
  final bool isFavorite;

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
      this.rating,
      this.isFavorite,
      this.destinationName});

  static List<PlaceModel> getDummyPlace() {
    var placeNames = [
      "Maldives Tour",
      "Nepal Tour",
      "Thailand Tour",
      "Bali Tour"
    ];
    var times = ['30 days', '20 days', '10 days', '40days'];
    var distances = ['100 KM', '200 KM', '150 KM', '90KM'];
    var destinations = ["Maldives", "Nepal", "Thailand", "Bali"];

    var placeImageUrl = [
      "https://www.britishairways.com/assets/images/destinations/components/pathfinderBodyCopy/maldives/holidays/642x856-487833893.jpg",
      "https://www.himalayanexploration.com/wp-content/uploads/2017/08/Bouddhanath-a-largest-stupa.jpg",
      "http://www.holidaytours.one/wp-content/uploads/2014/07/Thailand-tour.jpg",
      "https://www.samabe.com/home-assets/uploads/images/images-header/samabe-bali-home-page-header-portrait.jpg",
    ];

    List<PlaceModel> placeList = [];
    for (var i = 0; i < 4; i++) {
      placeList.add(PlaceModel(
          name: placeNames[i],
          time: times[i],
          distance: distances[i],
          description:
              "One of the largest artificial island itn the world, it is also easily accessbible by monorail, which runs down a treetrunk to connect the mainland's rail system",
          likes: i + 1 * 100,
          mainImage: placeImageUrl[i],
          rating: i % 5.0,
          isFavorite: i / 2 == 0,
          destinationName: destinations[i],
          imageList: [
            'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__340.jpg',
            'https://cdn.pixabay.com/photo/2016/01/08/11/57/butterfly-1127666__340.jpg',
            'https://cdn.pixabay.com/photo/2017/04/09/09/56/avenue-2215317__340.jpg',
            'https://cdn.pixabay.com/photo/2016/04/20/19/47/wolf-1341881__340.jpg',
            'https://cdn.pixabay.com/photo/2017/09/16/16/09/sea-2755908__340.jpg'
          ],
          topUsers: [
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png'
          ]));
    }

    return placeList;
  }
}
