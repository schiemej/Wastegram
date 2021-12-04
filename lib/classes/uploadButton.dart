import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio_project/screens/NewPostScreen.dart';

// ignore: must_be_immutable, camel_case_types
class uploadButton extends StatelessWidget {

// ignore: camel_case_types
  File? image;
  final picker = ImagePicker();

  void retrieveImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
  }

  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text('Select photo'),
        onPressed: () async {
          retrieveImage();
          if (image != null){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPostScreen(image!)));
          }
        }
    );
  }
}

