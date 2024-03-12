import 'package:flutter/material.dart';

class Counter_Screen extends StatefulWidget {
  const Counter_Screen({super.key});

  @override
  State<Counter_Screen> createState() => _Counter_ScreenState();
}

class _Counter_ScreenState extends State<Counter_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Ex'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('0', style:  TextStyle(fontSize: 30),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}