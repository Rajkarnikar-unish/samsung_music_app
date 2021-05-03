import 'package:flutter/material.dart';

class CircleButtons extends StatelessWidget {
  final Widget child;
  final Color color;

  const CircleButtons({Key key,@required this.color, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: child
    );
  }
}