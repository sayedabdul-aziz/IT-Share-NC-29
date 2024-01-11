import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insights_news_1_11/core/services/local_storage.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  String name = '';
  String? imagePath;
  @override
  void initState() {
    super.initState();
    AppLocalStorage.getCachedData(AppLocalStorage.NAME_KEY).then((value) {
      setState(() {
        name = value;
      });
    });
    AppLocalStorage.getCachedData(AppLocalStorage.IMAGE_KEY).then((value) {
      setState(() {
        imagePath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: getTitleStyle(color: AppColors.white, fontSize: 18),
            ),
            Text(
              'Have a nice day',
              style: getBodyStyle(fontSize: 14),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.lemonadaColor,
          backgroundImage: (imagePath != null)
              ? FileImage(File(imagePath!)) as ImageProvider
              : const AssetImage('assets/user.png'),
        ),
      ],
    );
  }
}
