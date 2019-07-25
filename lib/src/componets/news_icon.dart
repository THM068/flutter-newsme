import 'package:flutter/material.dart';

class NewsIcon extends StatelessWidget {

  final IconData icon;
  final Function onPressed;

  NewsIcon({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
//    IconButton
    return IconButton(
      splashColor:  Color(0x1fEB1555),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(0.0),
      icon: Icon(icon, color: Colors.grey,),
      onPressed: this.onPressed,
      tooltip: "Bookmark Article",
    );
  }

}
