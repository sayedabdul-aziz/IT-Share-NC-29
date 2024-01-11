import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app_1_1/core/functions/routing.dart';
import 'package:taskati_app_1_1/core/utils/text_styles.dart';
import 'package:taskati_app_1_1/featuers/home/home_view.dart';

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
      pushToWithReplacment(context, const HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/logo.json',
              height: 250,
            ),
            Text(
              'Taskati',
              style: getBodyStyle(fontSize: 26),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Gap(10),
            Text(
              'It\'s time to get organized',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
