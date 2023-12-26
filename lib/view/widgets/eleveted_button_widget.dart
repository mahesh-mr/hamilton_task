import 'package:flutter/material.dart';

import '../const/const.dart';

class ElevetedButtonWidget extends StatelessWidget {
  ElevetedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.title,
    this.btncolor = appBlue,
  }) : super(key: key);
  final VoidCallback onPressed;
  final double height;
  final double width;
  final String title;
  final Color? btncolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: btncolor,
            minimumSize: Size(width, height),
            elevation: 0),
        onPressed: onPressed,
        child: Text(title));
  }
}
