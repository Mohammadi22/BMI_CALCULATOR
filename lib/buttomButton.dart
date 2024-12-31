import 'package:bmicalculator/constants.dart';
import 'package:flutter/cupertino.dart';

class ButtonButtom extends StatelessWidget {
  final String? tile;
  final VoidCallback? onTop;
  ButtonButtom({required this.tile, required this.onTop});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Container(
        child: Center(child: Text(tile!,style: kLargeButtonStyle)),
        margin: EdgeInsets.only(top: 10),
        color: kButtonContainerColor,
        width: double.infinity,
        height: kButtonContainerHeight,
      ),
    );
  }
}