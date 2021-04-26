import 'package:flutter/material.dart';

class CustomImageFPHome extends StatelessWidget {
  const CustomImageFPHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            "assets/images/FlashPark Icon2.png",
            height: 100,
            width: 300,
          ),
        ],
      ),
    );
  }
}
