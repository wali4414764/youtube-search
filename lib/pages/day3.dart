

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day3  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 190, width: 190, color: Colors.red),
        Container(height: 60, width: 60, color: Colors.orange),
      Container(height: 60, width: 60, color: Colors.purple),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 190, width: 190, color: Colors.pink),
              Container(height: 60, width: 60, color: Colors.green),
              Container(height: 60, width: 60, color: Colors.brown),

            ],
          )

        ],
      ),
    );
  }
}
