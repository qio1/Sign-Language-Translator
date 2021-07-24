// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visible Sound',
      home: MenuSelection(),
    );
  }
}

class MenuSelection extends StatefulWidget {
  @override
  _MenuSelectionState createState() => _MenuSelectionState();
}

class _MenuSelectionState extends State<MenuSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Center(child: const Text('Visible Sound')),
      ),
      body: Center(child: MyButtons()),
    );
  }
}

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.lightGreen[300],
      onPrimary: Colors.black,
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      textStyle: const TextStyle(fontSize: 18),
      padding: EdgeInsets.all(25.0),
    );
    return new GestureDetector(
        onTap: () {
          //print('MyButton was tapped!');
        },
        child: new Container(
          constraints: BoxConstraints(minWidth: 150, maxWidth: 350),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30),
                child: Image.asset("assets/images/icon.png",
                    width: 200, height: 200),
              ),
              Padding(
                padding: EdgeInsets.only(left: 42, right: 42, top: 0, bottom: 30),
                child: Text(
                    'Select a picture of sign language to start translation.',
                    style: TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center),
              ),
              ElevatedButton.icon(
                style: style,
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 24.0,
                ),
                onPressed: () {},
                label: Text("From Photo Library"),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: style,
                icon: Icon(
                  Icons.camera_alt,
                  size: 24.0,
                ),
                onPressed: () {},
                label: Text('New Photo'),
              )
            ],
          ),
        ));
  }
}
