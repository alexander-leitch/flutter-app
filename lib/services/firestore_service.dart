import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_profile.dart';
import '../models/image_data.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // --- User Profile ---

  Future<void> saveUserProfile(UserProfile user) async {
    await _db.collection('users').doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future<UserProfile?> getUserProfile(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserProfile.fromMap(doc.data()!, uid);
    }
    return null;
  }

  // --- Images ---

  Future<void> addImageMetadata(ImageData image) async {
    await _db.collection('images').doc(image.id).set(image.toMap());
  }

  Stream<List<ImageData>> getUserImages(String userId) {
    return _db
        .collection('images')
        .where('uploaderId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ImageData.fromMap(doc.data(), doc.id)).toList();
    });
  }
}
