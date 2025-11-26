import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Uuid _uuid = const Uuid();

  Future<String> uploadImage({
    required File file,
    required String userId,
  }) async {
    final String imageId = _uuid.v4();
    final Reference ref = _storage.ref().child('uploads/$userId/$imageId.jpg');

    final UploadTask uploadTask = ref.putFile(file);
    final TaskSnapshot snapshot = await uploadTask;

    return await snapshot.ref.getDownloadURL();
  }
}
