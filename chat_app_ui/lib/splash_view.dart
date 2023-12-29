import 'package:chat_app_ui/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/chat_logo.png',
            height: 250,
          ),
          const SizedBox(height: 20),
          const Text(
            'Chatia',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Chatting with Anyone, Anywhere, Anytime.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      )),
    );
  }
}
