import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:portfolio_project/classes/imageUpload.dart';
import 'package:portfolio_project/classes/postUpload.dart';
//import 'package:portfolio_project/classes/imageUpload.dart';


class NewPostScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final File image_url;
  // ignore: non_constant_identifier_names
  const NewPostScreen(this.image_url);
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final formKey = GlobalKey<FormState>();
  late LocationData locationData;
  late final _image = widget.image_url;
  late int intVal;

  @override
  void initState(){
    super.initState();
    getCurrentLocation();
  }
  getCurrentLocation() async{
    var locationService = Location();
    locationData = await locationService.getLocation();
   // setState(() {});
  }


  checkNullImage(){
    if (Image.file(_image) == null){
      return CircularProgressIndicator();
    }
    else{
      return Container(
        width: 500,
        height: 200,
        child: Image.file(widget.image_url, fit: BoxFit.fitWidth,),
      );
    }
  }

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
        body:
        SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 100, start: 10, end: 10, bottom: 50),
                      child: Text('New Post Screen', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20))),

                  Padding(
                    padding: EdgeInsets.only(bottom: 40, left: 20, right: 40),
                    child: checkNullImage(),
                      ),

                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20, top: 40),
                      child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'Number of wasted items.', border: OutlineInputBorder()
                          ),
                          onSaved: (value){
                            intVal = int.parse(value!);
                          },
                          validator: (value){
                            if (value!.isEmpty){
                              return 'Please enter the number of wasted items!';
                            }
                            else{
                              return null;
                            }
                          }
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        Semantics(
                            button: true,
                            enabled: true,
                            onTapHint: 'Upload post to the cloud',
                            child:
                            Container(
                              height: 75,
                              width: double.infinity,
                                child: FloatingActionButton(
                                    onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              uploadImage(_image).then((value){
                                  postUpload(locationData.latitude, locationData.longitude, intVal, value);
                                });
                              Navigator.popAndPushNamed(context, '/');
                                }
                              }
                            )
                          )
                        )
                      )
                    )
                    ]
              ),
            ),
        ),
          );
  }

}
