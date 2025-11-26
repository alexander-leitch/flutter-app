import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final String? displayName;
  final String? photoURL;
  final bool isPublic;
  final bool isAdultContent; // User preference/self-attestation
  final DateTime? birthDate;

  UserProfile({
    required this.uid,
    this.displayName,
    this.photoURL,
    this.isPublic = true,
    this.isAdultContent = false,
    this.birthDate,
  });

  factory UserProfile.fromMap(Map<String, dynamic> data, String uid) {
    return UserProfile(
      uid: uid,
      displayName: data['displayName'],
      photoURL: data['photoURL'],
      isPublic: data['isPublic'] ?? true,
      isAdultContent: data['isAdultContent'] ?? false,
      birthDate: (data['birthDate'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'photoURL': photoURL,
      'isPublic': isPublic,
      'isAdultContent': isAdultContent,
      'birthDate': birthDate != null ? Timestamp.fromDate(birthDate!) : null,
    };
  }
}
