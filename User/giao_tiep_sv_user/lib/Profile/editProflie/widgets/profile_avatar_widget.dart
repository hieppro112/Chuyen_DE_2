import 'package:flutter/material.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String avatarUrl;
  final VoidCallback onCameraPressed;

  const ProfileAvatarWidget({
    super.key,
    required this.avatarUrl,
    required this.onCameraPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(radius: 50, backgroundImage: NetworkImage(avatarUrl)),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.camera_alt, size: 18, color: Colors.blue),
              onPressed: onCameraPressed,
            ),
          ),
        ),
      ],
    );
  }
}
