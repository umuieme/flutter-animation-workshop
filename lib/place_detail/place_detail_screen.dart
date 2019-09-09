import 'package:flutter/material.dart';
import 'package:flutter_workshop_animation/model/place_model.dart';
import 'package:flutter_workshop_animation/place_detail/place_detail.dart';

class PlaceDetailScreen extends StatefulWidget {
  final PlaceModel placeModel;

  const PlaceDetailScreen({Key key, @required this.placeModel})
      : super(key: key);

  @override
  _PlaceDetailScreenState createState() =>
      _PlaceDetailScreenState(this.placeModel);
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen>
    with SingleTickerProviderStateMixin {
  PlaceModel placeModel;

  AnimationController _controller;

  _PlaceDetailScreenState(this.placeModel);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return PlaceDetail(
      placeModel: placeModel,
      controller: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
