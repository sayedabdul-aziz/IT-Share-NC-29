import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety_1_22/core/functions/routing.dart';
import 'package:se7ety_1_22/features/patient/home/presentation/nav_bar.dart';
import 'package:se7ety_1_22/features/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  User? user;
  getUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    getUser();
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        user == null
            ? pushToWithReplacement(context, const WelcomeView())
            : pushToWithReplacement(context, const PatientMainPage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
