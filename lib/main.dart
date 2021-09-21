import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffC1007E),
        accentColor: Color(0xff9e9e9e),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
