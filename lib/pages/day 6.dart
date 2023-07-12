import 'package:flutter/material.dart';

class MyStateFullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyStateFullWidgetState();
  }
}

class _MyStateFullWidgetState extends State<MyStateFullWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 6"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value $value",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                increament();

              },
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                decrement();
              },
              child: Icon(Icons.remove),
            ),
            containerButton()
          ],
        ),
      ),
    );
  }

  void increament() {
    setState(() {
      value += 1;
    });
  }
  void decrement(){
    setState(() {
      value -= 1;
    });
  }
  Widget containerButton(){
    return InkWell(
      onTap: (){
        setState(() {
          value+=2;
        });

      },
      child: Container(
        height: 70,
        width: 270,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(70))
        ),
        child: Text("Double Increment"),
      ),
    );
  }
}

