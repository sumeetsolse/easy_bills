import 'package:flutter/material.dart';

class ScreenCreateUpdateUserProfile extends StatelessWidget {
  const ScreenCreateUpdateUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: const Center(
        child: Text("User Profile"),
      ),
    );
  }
}