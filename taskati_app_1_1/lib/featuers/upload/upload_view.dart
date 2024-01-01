import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app_1_1/core/functions/routing.dart';
import 'package:taskati_app_1_1/core/services/local_storage.dart';
import 'package:taskati_app_1_1/core/utils/app_colors.dart';
import 'package:taskati_app_1_1/core/widgets/custom_button.dart';
import 'package:taskati_app_1_1/core/widgets/custom_snackbar.dart';
import 'package:taskati_app_1_1/featuers/home/home_view.dart';

String? imagePath;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                // all is done
                if (imagePath != null && name.isNotEmpty) {
                  AppLocal.cacheData('image', imagePath!);
                  AppLocal.cacheData('name', name);
                  pushToWithReplacment(context, const HomeView());
                } else if (imagePath == null && name.isNotEmpty) {
                  showErrorText(context, 'Please Upload your photo');
                } else if (imagePath != null && name.isEmpty) {
                  showErrorText(context, 'Please Enter your name');
                } else {
                  showErrorText(
                      context, 'Please Upload your photo and Enter your name');
                }
              },
              child: const Text('Done')),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: AppColors.primaryColor,
                  backgroundImage: (imagePath != null)
                      ? FileImage(File(imagePath!)) as ImageProvider
                      : const AssetImage('assets/user.png'),
                ),
                const Gap(20),
                CustomButton(
                  text: 'Upload from Camera',
                  onPressed: () {
                    uploadFromCamera();
                  },
                ),
                Image.asset('assets/kaaba.png'),
                const Gap(10),
                CustomButton(
                  text: 'Upload from Gallery',
                  onPressed: () {
                    uploadFromGallery();
                  },
                ),
                const Gap(10),
                Divider(indent: 20, endIndent: 20, color: AppColors.greyColor),
                const Gap(10),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration:
                      const InputDecoration(hintText: 'Enter Your Name'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadFromCamera() async {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePicked != null) {
      setState(() {
        imagePath = imagePicked.path;
      });
    }
  }

  uploadFromGallery() async {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      setState(() {
        imagePath = imagePicked.path;
      });
    }
  }
}
