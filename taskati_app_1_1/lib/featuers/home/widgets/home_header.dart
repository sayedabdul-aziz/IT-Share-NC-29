import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati_app_1_1/core/services/local_storage.dart';
import 'package:taskati_app_1_1/core/utils/app_colors.dart';
import 'package:taskati_app_1_1/core/utils/text_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? imagePath;
  String? name;

  @override
  void initState() {
    super.initState();
    AppLocal.getcachedData('image').then((value) {
      setState(() {
        imagePath = value;
      });
    });
    AppLocal.getcachedData('name').then((value) {
      setState(() {
        name = value;
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
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Hello, ',
                  style: getTitleStyle(color: AppColors.blackColor)),
              TextSpan(text: name, style: getTitleStyle())
            ])),
            const Text('Have a Nice Day'),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundImage: (imagePath != null)
              ? FileImage(File(imagePath!)) as ImageProvider
              : const AssetImage('assets/user.png'),
        )
      ],
    );
  }
}
