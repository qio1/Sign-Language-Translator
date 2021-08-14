// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tflite/tflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visible Sound',
      debugShowCheckedModeBanner: false,
      home: MenuSelection(),
    );
  }
}

class MenuSelection extends StatefulWidget {
  @override
  _MenuSelectionState createState() => _MenuSelectionState();
}

class _MenuSelectionState extends State<MenuSelection> {
 late File _pickedImage;
  bool _loading = false;
  List<dynamic>? _outputs;

  void _pickImage() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
      _cropImage(_pickedImage!.path);
    });
  }

  void _shootImage() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
      _cropImage(_pickedImage!.path);
    });
  }

    _cropImage(filePath) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: filePath,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        androidUiSettings:
            AndroidUiSettings(toolbarTitle: 'Cropper', lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      _pickedImage = croppedFile;
      setState(() {
      });
      classifyImage(_pickedImage);
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;

      _outputs = output;
    });
  }

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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Center(child: const Text('Visible Sound')),
        ),
        body: _loading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Center(
                child: new Container(
                  constraints: BoxConstraints(minWidth: 150, maxWidth: 350),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Image.asset("assets/images/icon.png",
                            width: 200, height: 200),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 42, right: 42, top: 0, bottom: 30),
                        child: Text(
                            'Upload a picture of sign language to start translation.',
                            style: TextStyle(
                              fontSize: 18,
                               fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center
                        ),
                      ),
                      ElevatedButton.icon(
                        style: style,
                        icon: Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 24.0,
                        ),
                        onPressed: _pickImage,
                        label: Text("From Photo Library"),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton.icon(
                        style: style,
                        icon: Icon(
                          Icons.camera_alt,
                          size: 24.0,
                        ),
                        onPressed: _shootImage,
                        label: Text('New Photo'),
                      )
                    ],
                ),

              )
        )
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translation"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}