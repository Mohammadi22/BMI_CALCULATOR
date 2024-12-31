
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RounRawMaterialButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  RounRawMaterialButton({required this.icon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        elevation: 6,
        fillColor: Color(0xFF4C4F5E),
        shape: CircleBorder(),
        onPressed: onPressed
    );
  }
}
