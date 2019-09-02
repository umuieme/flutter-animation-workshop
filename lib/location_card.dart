import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_workshop_animation/location_model.dart';

class LocationCard extends StatelessWidget {
  final Location location;

  LocationCard(this.location);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //todo go to detail page
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Hero(
            tag: location.imageUrl,
            child: Image.network(
              location.imageUrl,
              fit: BoxFit.cover,
            ),
          );
        }));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.network(
                location.imageUrl,
                fit: BoxFit.cover,
              )),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              height: 52,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    topRight: Radius.circular(32)),
                color: Colors.black.withOpacity(0.2),
              ),
              child: Center(
                child: Icon(
                  Icons.star_border,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  location.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                RatingBar(
                  initialRating: location.rating,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 16,
                  unratedColor: Colors.black,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
