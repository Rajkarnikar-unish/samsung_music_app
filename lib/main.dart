import 'package:flutter/material.dart';
import './screens.dart/songs_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samsung Music App',
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black54,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                bodyText2: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              )),
      home: SongsListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
