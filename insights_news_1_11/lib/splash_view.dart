import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_1_11/core/functions/functions.dart';
import 'package:insights_news_1_11/core/services/local_storage.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';
import 'package:insights_news_1_11/featuers/home/nav_bar.dart';
import 'package:insights_news_1_11/featuers/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isUpload = false;
  @override
  void initState() {
    super.initState();

    // to check what is the next screen
    AppLocalStorage.getCachedData(AppLocalStorage.IS_UPLOAD_KEY).then((value) {
      setState(() {
        isUpload = value ?? false;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      pushWithReplacment(
          context, isUpload ? const NavBarView() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png'),
          const Gap(20),
          Text(
            'Insights News',
            style: getTitleStyle(fontSize: 24),
          ),
          const Gap(20),
          Text('Stay Informed, Anytime, Anywhere.', style: getSmallStyle()),
        ],
      )),
    );
  }
}
