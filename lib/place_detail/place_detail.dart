import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_animation/model/place_model.dart';
import 'package:flutter_workshop_animation/place_detail/place_detail_animator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceDetail extends StatefulWidget {
  final PlaceModel placeModel;

  PlaceDetail({@required this.placeModel});

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
        _buildBody(),
        isDetailInfoShowing
            ? PlaceDetailAnimator(placeModel: widget.placeModel)
            : SizedBox(),
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
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
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
                  SizedBox(
                    height: 40,
                  ),
                  _buildImageList(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildImageList() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.placeModel.imageList.map((image) {
          return Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 180,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDetailInfoShowing = true;
          });
        },
        child: Text(
          widget.placeModel.description,
          style: TextStyle(color: Colors.white, shadows: [
            Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
          ]),
        ),
      ),
    );
  }

  Widget _buildTimeAandDistance() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.clock,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            widget.placeModel.time.toUpperCase(),
            style: TextStyle(color: Colors.white, shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
            ]),
          ),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.flag, color: Colors.white),
          SizedBox(width: 10),
          Text(widget.placeModel.distance.toUpperCase(),
              style: TextStyle(color: Colors.white, shadows: [
                Shadow(
                    color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
              ]))
        ],
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        widget.placeModel.name,
        style: TextStyle(color: Colors.white, fontSize: 24, shadows: [
          Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10)
        ]),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *
              (isDetailInfoShowing ? 0.5 : 1.0),
          foregroundDecoration:
              BoxDecoration(color: Colors.black.withOpacity(0.3)),
          child: CachedNetworkImage(
            imageUrl: widget.placeModel.mainImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
