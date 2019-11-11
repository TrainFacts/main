import 'package:flutter/material.dart';
import 'dart:convert';



class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key); // ?
  @override
  Widget build(BuildContext context) {
      return Card(
      child: Container(
        height: 200,
        decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
          image: new DecorationImage(
          fit: BoxFit.fill,
      image: new AssetImage('assets/img/ichi.jpg'),
    ),
    ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // BEGIN ListTile 1
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Dear Friends'),
              subtitle: Text('Please dont ditch me'),
            ),// END ListTile 1
          ],
        ),
      ),
    );
  } // Widget build
} // MyStatelessWidget
