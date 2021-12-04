
class NewPost {
  String? title;
  late int items;
  DateTime? dateTime;
  late double latitude;
  late double longitude;


  NewPost({
    this.title,
    required this.items,
    this.dateTime,
    required this.latitude,
    required this.longitude
  });
}