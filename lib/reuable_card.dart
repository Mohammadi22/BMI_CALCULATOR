import 'package:bmicalculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final VoidCallback? onPressed;
  ReusableCard({this.color,this.child,this.onPressed});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color ?? kActiveColorsCard,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}