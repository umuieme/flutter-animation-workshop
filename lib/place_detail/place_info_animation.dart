import 'package:flutter/material.dart';

class PlaceInfoAnimation {
  final AnimationController controller;

  final Animation<double> nameTranslationAnimation;
  final Animation<double> nameOpacityAnimation;

  final Animation<double> scheduleTranslationAnimation;
  final Animation<double> scheduleOpacityAnimation;

  final Animation<double> descriptionTranslationAnimation;
  final Animation<double> descriptionOpacityAnimation;

  final Animation<double> statsOpacityAnimation;
  final Animation<double> statsTrasnlationAnimation;

  final Animation<double> locationTranslationAnimation;
  final Animation<double> locationOpacityAnimation;

  final Animation<double> infoContainerAnimation;

  final Animation<double> fabOpacityAnimation;
    final Animation<double> fabTranslateAnimation;

      final Animation<double> commentOpacityAnimation;
    final Animation<double> commentTranslateAnimation;

  PlaceInfoAnimation(this.controller)
      : infoContainerAnimation = Tween<double>(begin: 1, end: 0.4).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.0, 0.3))),
        scheduleTranslationAnimation = Tween<double>(begin: -100, end: -150)
            .animate(
                CurvedAnimation(parent: controller, curve: Interval(0.25, 0.4))),
        scheduleOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.25, 0.4)),
        ),
        fabOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.35, 0.5))
        ),
        fabTranslateAnimation = Tween<double>(begin: 50, end: -24).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.35, 0.5))
        ),
        nameTranslationAnimation = Tween<double>(begin: 100, end: 0).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.45, 0.6))),
        nameOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.45, 0.6)),
        ),
        descriptionTranslationAnimation = Tween<double>(begin: 100, end: 0)
            .animate(
                CurvedAnimation(parent: controller, curve: Interval(0.55, 0.7))),
        descriptionOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.55, 0.7)),
        ),
        statsOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.65, 0.8))
        ),
        statsTrasnlationAnimation = Tween<double>(begin: 100, end: 0).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.65, 0.8))
        ),
         commentOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.75, 0.9))
        ),
        commentTranslateAnimation = Tween<double>(begin: 100, end: 0).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.75, 0.9))
        ),
        locationTranslationAnimation = Tween<double>(begin: 100, end: 0)
            .animate(
                CurvedAnimation(parent: controller, curve: Interval(0.85, 1.0))),
        locationOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.85, 1.0)),
        );
}
