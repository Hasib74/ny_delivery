import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'Menu Page',
            style: TextStyle(color: Colors.black),
          ),
        ],
      )),
    );
  }
}
