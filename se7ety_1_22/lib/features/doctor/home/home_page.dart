import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se7ety_1_22/core/utils/colors.dart';
import 'package:se7ety_1_22/core/utils/styles.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DoctorHomePage> {
  final TextEditingController _doctorName = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              splashRadius: 20,
              icon: Icon(Icons.notifications_active, color: AppColors.black),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'صــــــحّـتــي',
          style: getTitleStyle(color: AppColors.black)
              .copyWith(fontFamily: GoogleFonts.notoKufiArabic().fontFamily),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: 'مرحبا، ',
                    style: getbodyStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: user?.displayName,
                    style: getTitleStyle(),
                  ),
                ],
              )),
              Text("احجز الآن وكن جزءًا من رحلتك الصحية.",
                  style: getTitleStyle(color: AppColors.black, fontSize: 25)),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
