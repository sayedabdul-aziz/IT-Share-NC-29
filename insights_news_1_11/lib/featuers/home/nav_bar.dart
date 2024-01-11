import 'package:flutter/material.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/featuers/news/news_view.dart';
import 'package:insights_news_1_11/featuers/profile/profile_view.dart';
import 'package:insights_news_1_11/featuers/search/search_view.dart';
import 'package:insights_news_1_11/featuers/source/source_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 0;
  List<Widget> views = [
    const NewsView(),
    const SearchView(),
    const SourceView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.scaffoldBg,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.lemonadaColor,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_present_rounded), label: 'Source'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
