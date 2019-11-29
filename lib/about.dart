/// (c) Adrian Widjaja 2019 - licensed under MIT (https://opensource.org/licenses/MIT)
/// Based off the example at https://flutter.dev/docs/cookbook/networking/fetch-data and
///   and modified for use by Adrian Widjaja under the BSD License
/// Card format based off the example at https://api.flutter.dev/flutter/material/Card-class.html

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flushbar/flushbar.dart';
import 'package:http/http.dart' as http;

// Created using https://javiercbk.github.io/json_to_dart/

class AboutPost {
  final String hero;
  final String body;
  final String contact;
  final String image;
  final String version;

  AboutPost({this.hero, this.body, this.contact, this.image, this.version});

  factory AboutPost.fromJson(Map<String, dynamic> json) {
    return AboutPost(
      hero: json['hero'] as String,
      body: json['body'] as String,
      contact: json['contact'] as String,
      image: json['image'] as String,
      version: json['version'] as String,
    );
  }
}

Future<List<AboutPost>> fetchPost(context) async {
  try {
    final response =
        await http.get('https://trainfacts.github.io/assets/about.json');
    return parsePost(response.body);
  } catch (e) {
    Flushbar(
      title: "Your device is not connected to the Internet.",
      message:
          "The information stored offline may be outdated, incomplete or broken, so please use at your own risk. If this is a bug, please go to trainfacts.github.io/errors (Exception Code 2).",
    )..show(context);
    final response = await rootBundle.loadString('assets/about.json');
    return parsePost(response);
  }
}

// A function that converts a response body into a List<Post>.
List<AboutPost> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<AboutPost>((json) => AboutPost.fromJson(json)).toList();
}

class AboutPostKnight extends StatelessWidget {
  final List<AboutPost> post;

  AboutPostKnight({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) {
          return Container(
              child: new Wrap(children: <Widget>[
            new ListTile(
              title: new Text(
                  post[index].hero ??
                      'ERROR: Exception Code 1 – trainfacts.github.io/error',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            ),
            new ListTile(
              title: new Text(
                  post[index].body ??
                      'ERROR: Exception Code 1 – trainfacts.github.io/error',
                  style: TextStyle(fontSize: 15.0)),
            ),
            new ListTile(
              title: new Text(
                  post[index].contact ??
                      'ERROR: Exception Code 1 – trainfacts.github.io/error',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
            ),
            new ListTile(
              title: new Text(
                  post[index].version ??
                      'ERROR: Exception Code 1 – trainfacts.github.io/error',
                  style:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
            ),
            new ListTile(
              title: new Text(
                  'You are using version 1.0 of Train Facts' ??
                      'ERROR: Exception Code 4 – trainfacts.github.io/error',
                  style:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
            ),
            new Container(child: new Image.network(post[index].image)),
          ]));
        });
  }
}

void main() => runApp(AboutApp());

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Train Facts';

    return MaterialApp(
      title: appTitle,
      home: AboutAppState(title: appTitle),
    );
  }
}

class AboutAppState extends StatelessWidget {
  final String title;

  AboutAppState({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AboutPost>>(
      future: fetchPost(context),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? AboutPostKnight(post: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
