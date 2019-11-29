/// (c) Adrian Widjaja 2019 - licensed under MIT (https://opensource.org/licenses/MIT)

import 'package:flutter/material.dart';

void main() => runApp(LostPost());

class LostPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I\'m lost!',
      home: Scaffold(
        body: Center(
          child: Text('This is an upcoming feature. In the future, this area will contain a copy of your I\'m Lost card that can be used as a backup plan in case you lose your physical card. It will also contain details like your hotel addresses and phone numbers that you can use outside of an emergency.\n \n Watch out for the latest updates at trainfacts.github.io!', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}