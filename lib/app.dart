import 'package:flutter/material.dart';
import 'package:portfolio_project/screens/ListScreen.dart';
import 'screens/ListScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';



class App extends StatelessWidget {
  static final routes = {
    //'newPostScreen': (context) => NewPostScreen(),
  };

  @override
  Widget build(BuildContext context) {
    var totalWaste;
    return MaterialApp(
        //routes: routes,
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home:
        Builder(
            builder: (context) =>
                Scaffold(
                    appBar: AppBar(
                        title: Row(
                        children: [
                            Expanded(
                                child: Text('Wastegram')),

                            Expanded(
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData &&
                                      snapshot.data!.docs != null &&
                                      snapshot.data!.docs.length > 0){
                                      totalWaste = 0;
                                        for (int i = 0; i < snapshot.data!.docs.length; i++){
                                          int dbWaste = snapshot.data!.docs[i]['items'].toInt();
                                          totalWaste += dbWaste;
                                          }
                                          return Text('Items Wasted $totalWaste');
                                          }
                                    else{
                                          return Text('Items Wasted: 0');
                                          }
                                        }
                                      )
                                    ),
                                  ]
                                )
                              ),
                                body: ListScreen()
                            )
                          )
                        );
                      }
                    }
