import 'package:flutter/material.dart';

class Reward extends StatefulWidget {
  @override
  _RewardState createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Reward Page'),
       backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(child: Column(children: [
        Text(
          'Menu Page',
          style: TextStyle(color: Colors.black),
        ),
      ],)),
    );
  }
}