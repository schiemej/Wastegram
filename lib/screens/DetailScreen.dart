import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String image_url;
  final int latitude;
  final int longitude;
  final int itemsWasted;
  // ignore: non_constant_identifier_names
  const DetailScreen(this.image_url, this.latitude, this.longitude, this.itemsWasted);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}


class _DetailScreenState extends State<DetailScreen> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        //MainAxisAlignment.end for button
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child:
              Image.network(widget.image_url)
          ),
          Text('Latitude: ${widget.latitude}'+ ' Longitude: ${widget.longitude}'),
          Text('Items wasted: ${widget.itemsWasted}')
        ],
        ),
      ),
    );
  }
}
