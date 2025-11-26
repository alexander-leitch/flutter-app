import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/firestore_service.dart';
import '../models/user_profile.dart';
import '../models/image_data.dart';
import 'upload_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context, listen: false);
    final currentUser = FirebaseAuth.instance.currentUser;
    final isOwnProfile = currentUser?.uid == userId;

    return FutureBuilder<UserProfile?>(
      future: firestoreService.getUserProfile(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final userProfile = snapshot.data;

        if (userProfile == null) {
          return const Scaffold(body: Center(child: Text('User not found')));
        }

        // Privacy Check: If profile is private and not own profile, hide it.
        // Note: The requirement says "publicly available unless... labelled not to be".
        if (!userProfile.isPublic && !isOwnProfile) {
          return Scaffold(
            appBar: AppBar(title: const Text('Profile')),
            body: const Center(child: Text('This profile is private.')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(userProfile.displayName ?? 'Profile'),
            actions: [
              if (isOwnProfile)
                IconButton(
                  icon: const Icon(Icons.add_a_photo),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const UploadScreen()),
                    );
                  },
                ),
            ],
          ),
          body: Column(
            children: [
              _buildProfileHeader(userProfile, isOwnProfile, context),
              const Divider(),
              Expanded(
                child: _buildImageGrid(firestoreService, userId, isOwnProfile, currentUser),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileHeader(UserProfile profile, bool isOwnProfile, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: profile.photoURL != null
                ? NetworkImage(profile.photoURL!)
                : null,
            child: profile.photoURL == null ? const Icon(Icons.person, size: 40) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.displayName ?? 'User',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (isOwnProfile) ...[
                  const SizedBox(height: 8),
                  _buildPrivacyToggle(profile, context),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyToggle(UserProfile profile, BuildContext context) {
    // This is a simplified toggle. In a real app, this might be a separate settings screen.
    // We need a way to update the profile. For now, let's just show the status.
    // To implement update, we'd need to call FirestoreService.saveUserProfile.
    return Row(
      children: [
        Icon(profile.isPublic ? Icons.public : Icons.lock, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          profile.isPublic ? 'Public Profile' : 'Private Profile',
          style: const TextStyle(color: Colors.grey),
        ),
        // TODO: Add edit button to toggle privacy and adult content preference
      ],
    );
  }

  Widget _buildImageGrid(
      FirestoreService firestoreService, String userId, bool isOwnProfile, User? currentUser) {
    // We need to fetch the current user's profile to check THEIR age preference/verification status
    // if we are viewing someone else's profile.
    // Ideally this should be passed in or provided by a UserProvider.
    // For now, we'll assume we can fetch it or pass it.
    // Let's use a FutureBuilder to get the viewer's profile if needed.

    return FutureBuilder<UserProfile?>(
      future: currentUser != null ? firestoreService.getUserProfile(currentUser.uid) : Future.value(null),
      builder: (context, viewerSnapshot) {
        final viewerProfile = viewerSnapshot.data;
        final bool viewerIsAdult = viewerProfile?.isAdultContent ?? false;

        return StreamBuilder<List<ImageData>>(
          stream: firestoreService.getUserImages(userId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final images = snapshot.data!;
            
            // Filter images
            final visibleImages = images.where((image) {
              if (isOwnProfile) return true; // Owner sees everything

              // Privacy check
              if (!image.isPublic) return false;

              // Age check
              if (image.isAdultContent) {
                // Must be logged in and verified adult
                if (currentUser == null) return false;
                if (!viewerIsAdult) return false;
              }

              return true;
            }).toList();

            if (visibleImages.isEmpty) {
              return const Center(child: Text('No images to display.'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: visibleImages.length,
              itemBuilder: (context, index) {
                final image = visibleImages[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: image.url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: Colors.grey[300]),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
