import 'package:flutter/material.dart';
import 'package:flutter_workshop_animation/model/place_model.dart';
import 'package:flutter_workshop_animation/place_detail/place_detail_info.dart';

class PlaceDetailAnimator extends StatefulWidget {
  final PlaceModel placeModel;

  PlaceDetailAnimator({Key key, @required this.placeModel}) : super(key: key);
  @override
  _PlaceDetailAnimatorState createState() => _PlaceDetailAnimatorState();
}

class _PlaceDetailAnimatorState extends State<PlaceDetailAnimator>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return PlaceDetailInfo(
      widget.placeModel,
      _controller,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
