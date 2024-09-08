import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({
    super.key,
    required this.text,
    /*@required this.ontab*/
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14.0,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14.0,
            letterSpacing: 3.0,
            color: Color(0xffBAD0D0),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double textsize;
  final Color color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  const CustomText({
    required this.text,
    required this.textsize,
    required this.color,
    this.letterSpacing,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: textsize,
        letterSpacing: letterSpacing ?? 0.10,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
