import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/home.dart';
import 'package:flutter_sqlite/pages/newcourse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFE8A7E),
        accentColor: Color(0xFFFD7465)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
 routes: {

   '/' : (context)=>Home(),
   '/new' : (context)=>NewCourse(),
 },
    );
  }
}

