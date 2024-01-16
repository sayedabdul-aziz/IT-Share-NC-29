import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';
import 'package:insights_news_1_11/featuers/news/cubit/news_cubit.dart';
import 'package:insights_news_1_11/splash_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBg,
              appBarTheme: AppBarTheme(
                  backgroundColor: AppColors.scaffoldBg,
                  elevation: 0.0,
                  titleTextStyle: getTitleStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: getSmallStyle(),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lemonadaColor),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lemonadaColor),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              )),
          debugShowCheckedModeBanner: false,
          home: const SplashView()),
    );
  }
}
