import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firestore_service.dart';
import '../models/user_profile.dart';

class AgeVerificationDialog extends StatelessWidget {
  const AgeVerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Age Verification Required'),
      content: const Text(
        'This content is marked as 18+. To view it, you must verify that you are of legal age.\n\n'
        'By clicking "I am 18+", you confirm that you are at least 18 years old.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              final firestoreService = Provider.of<FirestoreService>(context, listen: false);
              final profile = await firestoreService.getUserProfile(user.uid);
              
              if (profile != null) {
                // Update user profile to mark as adult content viewer
                final updatedProfile = UserProfile(
                  uid: profile.uid,
                  displayName: profile.displayName,
                  photoURL: profile.photoURL,
                  isPublic: profile.isPublic,
                  isAdultContent: true, // Mark as verified
                  birthDate: profile.birthDate,
                );
                await firestoreService.saveUserProfile(updatedProfile);
              }
            }
            if (context.mounted) {
              Navigator.pop(context, true);
            }
          },
          child: const Text('I am 18+'),
        ),
      ],
    );
  }
}
