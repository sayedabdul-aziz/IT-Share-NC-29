import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ety_1_22/core/utils/colors.dart';
import 'package:se7ety_1_22/core/utils/styles.dart';
import 'package:se7ety_1_22/features/doctor/appointments/myAppointments.dart';
import 'package:se7ety_1_22/features/doctor/home/home_page.dart';
import 'package:se7ety_1_22/features/doctor/profile/userProfile.dart';

class DoctorMainPage extends StatefulWidget {
  const DoctorMainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<DoctorMainPage> {
  int _selectedIndex = 0;
  final List _pages = [
    const DoctorHomePage(),
    const DoctorAppointment(),
    const DoctorProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.2),
            ),
          ],
        ),
        child: GNav(
          curve: Curves.easeOutExpo,
          rippleColor: Colors.grey,
          hoverColor: Colors.grey,
          haptic: true,
          tabBorderRadius: 20,
          gap: 5,
          activeColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppColors.color1,
          textStyle: getbodyStyle(color: AppColors.white),
          tabs: const [
            GButton(
              iconSize: 28,
              icon: Icons.home,
              text: 'الرئيسية',
            ),
            GButton(
              iconSize: 28,
              icon: Icons.calendar_month_rounded,
              text: 'المواعيد',
            ),
            GButton(
              iconSize: 29,
              icon: Icons.person,
              text: 'الحساب',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
