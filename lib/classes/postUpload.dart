
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


getCurrentDate(){
  var date = new DateTime.now().toString();
  var dateParse = DateTime.parse(date);
  var formattedDate = "${dateParse.month}-${dateParse.day}-${dateParse.year}";
  return formattedDate;
}

void postUpload(lat, long, items, url) async {
  FirebaseFirestore.instance.collection('posts').add({
    'latitude': lat ,
    'longitude': long,
    'items': items,
    'date': getCurrentDate(),
    'url': url.toString()});
}