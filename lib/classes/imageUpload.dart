import 'package:firebase_storage/firebase_storage.dart';


Future<String> uploadImage(url) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child(url.toString() + DateTime.now().toString());
  UploadTask uploadTask = ref.putFile(url);
  String finalUrl = await (await uploadTask).ref.getDownloadURL();
  return finalUrl;
}
