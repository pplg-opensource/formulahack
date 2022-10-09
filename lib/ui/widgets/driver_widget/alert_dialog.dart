import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: ColorValues.backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        width: 330,
        height: 560,
      ),
    );
  }
}
