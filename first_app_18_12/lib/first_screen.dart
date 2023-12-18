import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white, size: 26),
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: const Text(
          'My First App',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/55.jpg'),
            ),
            SizedBox(height: 15),
            Text(
              'Sayed Abdul-Aziz',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook_rounded,
                  color: Colors.blue,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.snapchat,
                  color: Colors.yellow,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.telegram_rounded,
                  color: Colors.blueAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
