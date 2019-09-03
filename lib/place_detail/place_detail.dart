import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_workshop_animation/model/place_model.dart';
import 'package:flutter_workshop_animation/place_detail/place_detail_animator.dart';
import 'package:flutter_workshop_animation/place_detail/place_detail_enter_animation.dart';
import 'package:flutter_workshop_animation/place_detail/place_detail_info.dart';

class PlaceDetail extends StatefulWidget {
  final PlaceModel placeModel;
  final PlaceDetailAnimation animation;
  final AnimationController controller;

  PlaceDetail({@required this.placeModel, @required this.controller})
      : animation = PlaceDetailAnimation(controller) {
    print("place detail called");
  }

  @override
  _PlaceDetailState createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  bool isDetailInfoShowing = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildBackgroundImage(),
        isDetailInfoShowing
            ? PlaceDetailAnimator(placeModel: widget.placeModel)
            : SizedBox(),
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: isDetailInfoShowing
          ? SizedBox()
          : AnimatedBuilder(
              animation: widget.controller,
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
    );
  }

  Opacity _buildImageList() {
    return Opacity(
      opacity: widget.animation.imageListOpacityAnimation.value,
      child: Transform.translate(
        offset: Offset(widget.animation.imageListTranslationAnimation.value, 0),
        child: SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.placeModel.imageList.map((image) {
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
          opacity: widget.animation.descriptionOpacityAnimation.value,
          child: Transform.translate(
            offset: Offset(
                widget.animation.descriptionTranslationAnimation.value, 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDetailInfoShowing = true;
                });
              },
              child: Text(
                widget.placeModel.description,
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeAandDistance() {
    print("_buildTimeAandDistance for place detail");
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Opacity(
        opacity: widget.animation.scheduleOpacityAnimation.value,
        child: Transform.translate(
          offset:
              Offset(widget.animation.scheduleTranslationAnimation.value, 0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                widget.placeModel.time.toUpperCase(),
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
                ]),
              ),
              SizedBox(width: 20),
              Icon(Icons.flag, color: Colors.white),
              SizedBox(width: 10),
              Text(widget.placeModel.distance.toUpperCase(),
                  style: TextStyle(color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 10)
                  ]))
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
        opacity: widget.animation.nameOpacityAnimation.value,
        child: Transform.translate(
          offset: Offset(widget.animation.nameTranslationAnimation.value, 0),
          child: Text(
            widget.placeModel.name,
            style: TextStyle(color: Colors.white, fontSize: 24, shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    print("buildbackfournd ===== $isDetailInfoShowing");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *
              (isDetailInfoShowing ? 0.5 : 1.0),
          foregroundDecoration:
              BoxDecoration(color: Colors.black.withOpacity(0.3)),
          child: Image.asset(
            widget.placeModel.mainImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
