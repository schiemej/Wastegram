import 'package:flutter/material.dart';

// ignore: camel_case_types
class crashProgram extends StatelessWidget {

  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text('Force Crash'),
        onPressed:(){
          throw Exception("This is a crash!");
            },
    );

  }
}