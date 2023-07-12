import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TikTokUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 160,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Calling Via Zong",style: TextStyle(fontWeight: FontWeight.bold),)

              ],
            ),
          ),
          Positioned(
            left: 50,
            right: 8,
            top: 500,
            child: Column(
              children: [


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    Icon(Icons.speed),
                    Text("Speed"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 210,
                    ),
                    Icon(Icons.filter_1_sharp),
                    Text("Filters"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.timelapse),
                    Text("Timer"),
                  ],
                ),

              ],
            ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Column(
               children: [
                 SizedBox(
                   height: 20,
                 ),
                 Icon(Icons.flash_auto),
                 Text("Flash"),
               ],
             ),
             Column(
               children: [
                 SizedBox(
                   width: 210,
                   height: 20,
                 ),
                 Icon(Icons.flash_auto),
                 Text("Flash"),
               ],
             ),
             Column(
               children: [
                 SizedBox(
                   width: 20,
                   height: 20,
                 ),
                 Icon(Icons.flash_auto),
                 Text("Flash"),
           ],
         ),


            ],
          ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Icon(Icons.flash_auto),
                        Text("Flash"),
                  ],
                ),
            Column(
              children: [
                SizedBox(
                  width: 210,
                  height: 20,
                ),
                Icon(Icons.flash_auto),
                Text("Flash"),
            ],
          ),
            Column(
              children: [
              SizedBox(
              width: 20,
              height: 20,
            ),
            Icon(Icons.flash_auto),
            Text("Flash"),

          ],
            ),

    ],
      ),
    ],
    ),
    ),
    ],
    ),
    );
  }
}
