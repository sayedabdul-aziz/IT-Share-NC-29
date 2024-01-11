import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app_1_1/core/model/task_model.dart';
import 'package:taskati_app_1_1/core/utils/app_colors.dart';
import 'package:taskati_app_1_1/core/utils/text_styles.dart';
import 'package:taskati_app_1_1/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                centerTitle: true, titleTextStyle: getTitleStyle(fontSize: 20)),
            fontFamily: GoogleFonts.poppins().fontFamily,
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.redColor)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.redColor)),
            )),
        home: const SplashView());
  }
}
