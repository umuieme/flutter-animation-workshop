import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_animation/model/place_model.dart';
import 'package:flutter_workshop_animation/place_detail/place_info_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceDetailInfo extends StatefulWidget {
  final PlaceModel placeModel;
  final PlaceInfoAnimation animation;
  final AnimationController controller;

  PlaceDetailInfo(this.placeModel, this.controller)
      : animation = PlaceInfoAnimation(controller);

  @override
  _PlaceDetailInfoState createState() => _PlaceDetailInfoState();
}

class _PlaceDetailInfoState extends State<PlaceDetailInfo> {
  _PlaceDetailInfoState();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            _buildBody(),
            _buildTimeAandDistance(),
            _buildDirectionButton(),
          ],
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Positioned(
          top: MediaQuery.of(context).size.height *
              widget.animation.infoContainerAnimation.value,
          left: 0,
          right: 0,
          bottom: 0,
          child: child,
        );
      },
    );
  }

  Widget _buildDirectionButton() {
    return AnimatedBuilder(
      animation: widget.controller,
      child: Align(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(FontAwesomeIcons.locationArrow, color: Colors.lightBlue.withOpacity(0.5),),
            onPressed: () {},
          )),
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: widget.animation.fabOpacityAnimation.value,
          child: Transform.translate(
              offset: Offset(-24, widget.animation.fabTranslateAnimation.value),
              child: child),
        );
      },
    );
  }

  Widget _buildBody() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              _buildName(),
              SizedBox(
                height: 30,
              ),
              _buildDescription(),
              SizedBox(
                height: 30,
              ),
              _buildStats(),
              SizedBox(
                height: 20,
              ),
              _buildCommentImages(),
              SizedBox(
                height: 30,
              ),
              _buildTravelDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeAandDistance() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: AnimatedBuilder(
        animation: widget.controller,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(width: 10),
                Text(
                  widget.placeModel.time.toUpperCase(),
                  style: TextStyle(color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 10)
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.flag, size: 16, color: Colors.white),
                SizedBox(width: 10),
                Text(widget.placeModel.distance.toUpperCase(),
                    style: TextStyle(color: Colors.white, shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 10)
                    ]))
              ],
            )
          ],
        ),
        builder: (BuildContext context, Widget child) {
          return Opacity(
            opacity: widget.animation.scheduleOpacityAnimation.value,
            child: Transform.translate(
              offset: Offset(
                  0, widget.animation.scheduleTranslationAnimation.value),
              child: child,
            ),
          );
        },
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AnimatedBuilder(
        animation: widget.controller,
        child: Text(
          widget.placeModel.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        builder: (BuildContext context, Widget child) {
          return Opacity(
            opacity: widget.animation.nameOpacityAnimation.value,
            child: Transform.translate(
              offset:
                  Offset(0, widget.animation.nameTranslationAnimation.value),
              child: child,
            ),
          );
        },
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: AnimatedBuilder(
          animation: widget.controller,
          child: Text(
            widget.placeModel.description,
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: widget.animation.descriptionOpacityAnimation.value,
              child: Transform.translate(
                offset: Offset(
                    0, widget.animation.descriptionTranslationAnimation.value),
                child: child,
              ),
            );
          },
        ));
  }

  Widget _buildStats() {
    return AnimatedBuilder(
      animation: widget.controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.comment, size: 16,),
                SizedBox(width: 8),
                Text(widget.placeModel.commentCount.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.heart, size: 16,),
                SizedBox(width: 8),
                Text(widget.placeModel.likes.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.star, size: 16,),
                SizedBox(width: 8),
                Text(widget.placeModel.starCount.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.share, size: 16,),
                SizedBox(width: 8),
                Text(widget.placeModel.shareCount.toString()),
              ],
            )
          ],
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: widget.animation.statsOpacityAnimation.value,
          child: Transform.translate(
            offset: Offset(0, widget.animation.statsTrasnlationAnimation.value),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildCommentImages() {
    if (widget.placeModel.topUsers.isEmpty) return SizedBox();
    return AnimatedBuilder(
      animation: widget.controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: <Widget>[
            for (var image in widget.placeModel.topUsers) userAvatar(image),
            if (widget.placeModel.commentCount > 3) ...[
              Expanded(
                child: SizedBox(),
              ),
              Container(
                  height: 48,
                  width: 48,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.lightBlue.withOpacity(0.2)),
                  child: Icon(Icons.more_horiz))
            ]
          ],
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: widget.animation.commentOpacityAnimation.value,
          child: Transform.translate(
            offset: Offset(0, widget.animation.commentTranslateAnimation.value),
            child: child,
          ),
        );
      },
    );
  }

  Widget userAvatar(imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        child: Container(
          color: Colors.grey,
          height: 48,
          width: 48,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }

  Widget _buildTravelDetail() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            color: Colors.grey.withOpacity(0.2)),
        child: AnimatedBuilder(
          animation: widget.controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)))),
                padding: EdgeInsets.all(24),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.blue.withOpacity(0.4),
                      ),
                      backgroundColor: Colors.green.withOpacity(0.2),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "From",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Kathmandu",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "To",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(widget.placeModel.destinationName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Text("Commence the Tour"),
                color: Colors.blue,
                padding: EdgeInsets.all(24),
                textColor: Colors.white,
                onPressed: () {},
              )
            ],
          ),
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: widget.animation.locationOpacityAnimation.value,
              child: Transform.translate(
                offset: Offset(
                    0, widget.animation.locationTranslationAnimation.value),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
