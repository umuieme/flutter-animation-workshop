import 'package:flutter/widgets.dart';

class PlaceDetailAnimation{
  final AnimationController controller;
  final Animation<double> nameTranslationAnimation;
  final Animation<double> nameOpacityAnimation;
   final Animation<double> scheduleTranslationAnimation;
  final Animation<double> scheduleOpacityAnimation;
   final Animation<double> descriptionTranslationAnimation;
  final Animation<double> descriptionOpacityAnimation;
  final Animation<double> imageListTranslationAnimation;
  final Animation<double> imageListOpacityAnimation;
  PlaceDetailAnimation(this.controller) :
    nameTranslationAnimation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation( parent: controller, curve: Interval(0.0, 0.7))),
      nameOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 0.7)),
      ),
      scheduleTranslationAnimation = Tween<double>(begin: 170, end: 0).animate(
      CurvedAnimation( parent: controller, curve: Interval(0.1, 0.8))),
      scheduleOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.1, 0.9)),
      ),
      descriptionTranslationAnimation = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation( parent: controller, curve: Interval(0.2, 0.9))),
      descriptionOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.2, 0.9)),
      ),
      imageListTranslationAnimation = Tween<double>(begin: 130, end: 0).animate(
      CurvedAnimation( parent: controller, curve: Interval(0.3, 1.0))),
      imageListOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.3, 1.0)),
      )
  ;
}