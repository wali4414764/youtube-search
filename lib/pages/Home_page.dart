import 'package:flutter/material.dart';
import 'package:waleed/pages/day8.dart';

class Homepage extends StatelessWidget {
  final UserData userData;

  const Homepage({required this.userData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 1"),
      ),
      body: Center(
        child: Container(height: 100,
         width: 250,
            margin: EdgeInsets.symmetric(horizontal:50,vertical: 50),
padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
            decoration: BoxDecoration(
                color: Colors.orange,
              borderRadius:  BorderRadius.all(Radius.circular(40))
            ),
            child: Text(
              "username:${userData.username},userId ${userData.userId}",
              style: TextStyle(
                fontSize: 28,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
                backgroundColor: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
        ),
      ),
    );
  }
}
