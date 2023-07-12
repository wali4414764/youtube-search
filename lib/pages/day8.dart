import 'package:flutter/material.dart';
import 'package:waleed/pages/Home_page.dart';
import 'package:waleed/pages/sign%20up%20page.dart';


class UserData{
  final String username;
  final String userId;

  UserData(this.username, this.userId);
}

class Day8 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 8"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
             // Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpPage()));
              Navigator.pushNamed(context,'/signup');
            }, child: Text("Sign up")
            ),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context,'/login');
            }, child: Text("Sign in"),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context,'/homePage',arguments: UserData("waleed", "1"));
             // Navigator.push(context,MaterialPageRoute(builder: (_)=>Homepage(data: "Welcome to day 8")));
            }, child: Text("Home page"),
            ),
          ],
        ),
      ),
    );
  }
}

