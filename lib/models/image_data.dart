import 'package:cloud_firestore/cloud_firestore.dart';

class ImageData {
  final String id;
  final String uploaderId;
  final String url;
  final bool isPublic;
  final bool isAdultContent;
  final DateTime timestamp;

  ImageData({
    required this.id,
    required this.uploaderId,
    required this.url,
    required this.isPublic,
    required this.isAdultContent,
    required this.timestamp,
  });

  factory ImageData.fromMap(Map<String, dynamic> data, String id) {
    return ImageData(
      id: id,
      uploaderId: data['uploaderId'] ?? '',
      url: data['url'] ?? '',
      isPublic: data['isPublic'] ?? true,
      isAdultContent: data['isAdultContent'] ?? false,
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uploaderId': uploaderId,
      'url': url,
      'isPublic': isPublic,
      'isAdultContent': isAdultContent,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
