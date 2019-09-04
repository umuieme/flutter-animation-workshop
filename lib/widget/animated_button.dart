import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math.dart' show radians;

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController animationController;
  IconData heartIcon;
  double iconSize;
  Animation<double> scaleAnimation;
  Animation<double> iconScaleAnimation;
  double firstCircleOpacity = 0.0;
  double secondCircleOpacity = 0.0;
  double thirdCircleOpacity = 0.0;
  Animation<double> translation;
  double splashOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    heartIcon = FontAwesomeIcons.heart;
    iconSize = 84;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )..addListener(() {
        setState(() {});
      });

    scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.2)))
      ..addStatusListener((status) {});

    iconScaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.2, 0.8)))
      ..addListener(() {
        if (iconScaleAnimation.value > 1.9) {
          splashOpacity = 1.0;
        } else {
          splashOpacity = 0.0;
        }
      });

    translation = Tween<double>(
      begin: 92.0,
      end: 160.0,
    ).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) splashOpacity = 0.0;
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    animationController.forward(from: 0.0);
  }

  void _onTapUp(TapUpDetails details) {}

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            child: Transform.scale(
              scale: scaleAnimation.value,
              child: _animatedButtonUI,
            ),
          );
        });
  }

  Widget get _animatedButtonUI => Container(
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffe8c1c7),
              blurRadius: 30.0,
              offset: Offset(0.0, 30.0),
            ),
          ],
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Opacity(
                opacity: iconScaleAnimation.value > 1.7 &&
                        iconScaleAnimation.value < 2.0
                    ? 1.0
                    : 0.0,
                child: Container(
                  width: 152,
                  height: 152,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Center(
                    child: Container(
                      width: 148,
                      height: 148,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: iconScaleAnimation.value > 1.4 &&
                        iconScaleAnimation.value < 1.7
                    ? 1.0
                    : 0.0,
                child: Container(
                  width: 126,
                  height: 126,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Center(
                    child: Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
              ),
              _buildButton(0, color: Colors.red, iconAngle: -0.2),
              _buildButton(45, color: Colors.green, iconAngle: 0.6),
              _buildButton(135, color: Colors.blue, iconAngle: -0.6),
              _buildButton(180, color: Colors.black, iconAngle: 0.2),
              _buildButton(225, color: Colors.indigo, iconAngle: 0.8),
              _buildButton(270, color: Colors.pink, iconAngle: 1.48),
              _buildButton(315, color: Colors.yellow, iconAngle: -0.6),
              Transform.scale(
                scale: iconScaleAnimation.value,
                child: Icon(
                  scaleAnimation.value < 1.0
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: Colors.red,
                  size: scaleAnimation.value < 1.0 ? 48 : 84,
                ),
              ),
              Opacity(
                opacity: iconScaleAnimation.value > 1.0 &&
                        iconScaleAnimation.value < 1.4
                    ? 1.0
                    : 0.0,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.8),
                      shape: BoxShape.circle),
                ),
              )
            ],
          ),
        ),
      );

  _buildButton(double angle, {Color color, double iconAngle = 0.0}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: Transform.rotate(
          angle: iconAngle,
          child: Opacity(
            opacity: splashOpacity,
            child: Container(
              width: 16,
              height: 10,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(24.0))),
            ),
          ),
        ));
  }
}
