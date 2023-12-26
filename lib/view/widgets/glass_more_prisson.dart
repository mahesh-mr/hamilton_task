import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

// ignore: must_be_immutable
class CustomGlassMorePrissom extends StatelessWidget {
  CustomGlassMorePrissom({Key? key, required this.widget, required this.height,required this.width})
      : super(key: key);
  Widget widget;
  double height;
   double width;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      borderRadius: 10,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white70,
            Colors.white24
          ],
          stops: [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Center(child: widget),
    );
  }
}
