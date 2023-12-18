import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.green,
        title: const Text('My'),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
