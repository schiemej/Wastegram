//import 'dart:io';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_project/classes/uploadButton.dart';
import 'package:portfolio_project/screens/DetailScreen.dart';
import 'package:portfolio_project/classes/crashProgram.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData &&
          snapshot.data!.docs != null &&
          snapshot.data!.docs.length > 0) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var post = snapshot.data!.docs[index];
                      int itemNum = post['items'];
                      return
                        Semantics(
                          button: true,
                          enabled: true,
                          onTapHint: 'View details of post',
                          child: GestureDetector(
                          child:
                            ListTile(
                              title:    Text(post['date']),
                                trailing: Text('$itemNum')
                            ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(
                                  post['url'],
                                  post['latitude'].toInt(),
                                  post['longitude'].toInt(),
                                  post['items'].toInt()
                                    )
                                  )
                                );
                              }
                            ),
                          );
                        },
                      ),
                    ),

                Center(
                  child: uploadButton()
                )
                  ],
              );
            }
          else{
            return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                      child:
                        Center(
                          child:
                            CircularProgressIndicator()
                )
                  ),
                    Center(child:
                        Semantics(
                            button: true,
                            enabled: true,
                            onTapHint: 'Choose image from your gallery',
                            child: uploadButton()
                  )
                    ),
                  Center(child:
                      Semantics(
                        button: true,
                        enabled: true,
                        onTapHint: 'Forces program to crash for Crashlytics test.',
                        child: crashProgram()
                      )
                  )
                ]
              );
            }
          }
        );
    }
}
