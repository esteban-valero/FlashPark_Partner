import 'package:flutter/material.dart';

class CustomImageFP extends StatelessWidget {
  const CustomImageFP({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            "assets/images/Main_Icon.png",
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
