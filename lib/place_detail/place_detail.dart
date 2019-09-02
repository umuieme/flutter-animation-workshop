import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_workshop_animation/model/place_model.dart';
import 'package:flutter_workshop_animation/place_detail/place_detail_enter_animation.dart';

class PlaceDetail extends StatelessWidget {
  final PlaceModel placeModel;
  final PlaceDetailAnimation animation;
  final AnimationController controller;

  PlaceDetail({@required this.placeModel, @required this.controller})
      : animation = PlaceDetailAnimation(controller){
        print("place detail called");
      }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[_buildBackgroundImage(), _buildBody()],
    );
  }

  Widget _buildBody() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                _buildName(),
                SizedBox(
                  height: 20,
                ),
                _buildTimeAandDistance(),
                SizedBox(
                  height: 40,
                ),
                _buildDescription(),
                _buildImageList(),
              ],
            );
          },
        ),
      ),
    );
  }

  Opacity _buildImageList() {
    return Opacity(
      opacity: animation.imageListOpacityAnimation.value,
      child: Transform.translate(
        offset: Offset(animation.imageListTranslationAnimation.value, 0),
        child: SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: placeModel.imageList.map((image) {
              return Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Image.asset(
                    image,
                    height: 180,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Opacity(
          opacity: animation.descriptionOpacityAnimation.value,
          child: Transform.translate(
            offset: Offset(animation.descriptionTranslationAnimation.value, 0),
            child: Text(
              placeModel.description,
              style: TextStyle(color: Colors.white, shadows: [
                Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeAandDistance() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Opacity(
        opacity: animation.scheduleOpacityAnimation.value,
        child: Transform.translate(
          offset: Offset(animation.scheduleTranslationAnimation.value, 0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                placeModel.time.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
              ]
                ),
              ),
              SizedBox(width: 20),
              Icon(Icons.flag, color: Colors.white),
              SizedBox(width: 10),
              Text(placeModel.distance.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
              ]
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Opacity(
        opacity: animation.nameOpacityAnimation.value,
        child: Transform.translate(
          offset: Offset(animation.nameTranslationAnimation.value, 0),
          child: Text(
            placeModel.name,
            style: TextStyle(color: Colors.white, fontSize: 24, shadows: [
                Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
              ]),
            
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      placeModel.mainImage,
      fit: BoxFit.cover,
    );
  }
}
