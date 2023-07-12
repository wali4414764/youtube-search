
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Day4 extends StatelessWidget {
  int age=10;
  String name= "My Age Is:";
  double salary=50000.1254;
  bool isLight=false;
  num value=123456.12345;
  var digit=80.25;
  final x=21314;
  static const double pi=3.14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day4"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            FontAwesomeIcons.amazon,
            size: 90,
            color: Colors.deepOrange,
          ),),
          Text("$name $age, salary $salary isLight $isLight"),
          Container(height: 40, width: 80,color: Colors.red,),
    SizedBox(height: 80,),
    Row(
      children: [
    Container(height: 40, width: 80,color: Colors.red,),
        Expanded(child: Container(height: 40, width: 80,color: Colors.purple,)),
      ],
    ),
    Expanded(child: Container(height: 40, width: 80,color: Colors.red,)),
        ],
      ),
    );
  }
}
