
import 'package:flutter/material.dart';
import 'package:waleed/Image_Page.dart';
import 'package:waleed/pages/Call%20UI.dart';
import 'package:waleed/pages/Home_page.dart';
import 'package:waleed/pages/TikTokUI.dart';
import 'package:waleed/pages/day%205.dart';
import 'package:waleed/pages/day%206.dart';
import 'package:waleed/pages/day3.dart';
import 'package:waleed/pages/day4.dart';
import 'package:waleed/pages/day7.dart';
import 'package:waleed/pages/day8.dart';
import 'package:waleed/pages/login%20page.dart';
import 'package:waleed/pages/on%20generate%20route.dart';
import 'package:waleed/pages/sign%20up%20page.dart';

void main() {
  runApp(MyApp());

  }
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(primarySwatch:Colors.purple ),
     themeMode: ThemeMode.dark,
     darkTheme: ThemeData(
       brightness: Brightness.light,
           primarySwatch: Colors.red,
     ),
     initialRoute: "/",
    // routes: {
     //  "/day8":(_)=>Day8(),
    //   "/":(context)=>Homepage(),
     //  "/login":(context)=>LoginPage(),
      // "/SignUpPage":(context)=>SignUpPage(),
       //"/Day7":(context)=>Day7(),
     //},
     onGenerateRoute: OnGenerateRoute.route,
     debugShowCheckedModeBanner: false,
     title: "flutter 30 days challenge",
    // home: MyStateFullWidget(),
   );
  }

}