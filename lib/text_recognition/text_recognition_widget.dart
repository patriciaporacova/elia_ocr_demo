import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_demo_firebase_ml/text_recognition/google_ml_api.dart';

import 'controls_widget.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({
    Key key,
  }) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';
  File _image;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Text Demo'),
    ),
    body: SafeArea(
      child: Column(
        children: [
          text == ''
              ? Expanded(child: buildImage())
              : Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      text,
                      showCursor: true,
                      onSelectionChanged: (selection, selecto) {
                        print('selection: $selection');
                        print('selecto: $selecto');
                      },
                      onTap: () {
                        print('tap');
                      },
                    ),
                  ),
                ),
          const SizedBox(height: 16),
          // Text(text == '' ? 'no text' : text),
          Center(
            child: ControlsWidget(
              onClickedPickImage: pickImage,
              onClickedClear: clear,
              onClickedCamera: openCamera,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );

  Widget buildImage() => Container(
        child: _image != null ? Image.file(_image) : Icon(Icons.photo, size: 80, color: Colors.black),
      );

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null && image.path != null) {
      setImage(File(image.path));
      scanText();
    }
  }

  Future openCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) {
            _image = file;
            Navigator.pop(context);
            scanText();
            setState(() {});
          },
        ),
      ),
    );
  }

  Future scanText() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    final text = await GoogleMLApi.recogniseTextFromFile(_image);
    setText(text);
    Navigator.of(context).pop();
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void setImage(File newImage) {
    setState(() {
      _image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }
}
