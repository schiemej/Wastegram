
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_project/classes/newPost.dart';


void main() {
  test("Object should return the same values as it's given", (){
    var title = 'fakeURL';
    var items = 1;
    var dateTime = DateTime.parse('2020-01-01');
    var latitude = 1.0;
    var longitude = 2.0;

    final testWastePost = NewPost(
        title: title,
        items: items,
        dateTime: dateTime,
        latitude: latitude,
        longitude: longitude
    );
    expect(testWastePost.dateTime, dateTime);
    expect(testWastePost.items, items);
    expect(testWastePost.title, title);
    expect(testWastePost.latitude, latitude);
    expect(testWastePost.longitude, longitude);
    });
}

