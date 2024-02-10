import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ety_1_22/core/utils/colors.dart';
import 'package:se7ety_1_22/core/utils/styles.dart';
import 'package:se7ety_1_22/core/widgets/tile_widget.dart';
import 'package:se7ety_1_22/features/patient/profile/appointmentHistoryList.dart';
import 'package:se7ety_1_22/features/patient/profile/userSettings.dart';
import 'package:se7ety_1_22/features/patient/search/presentaion/view/widgets/contact_icon.dart';

class DoctorProfileView extends StatefulWidget {
  const DoctorProfileView({super.key});

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfileView> {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://se7ety-2b286.appspot.com');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _imagePath;
  File? file;
  String? profileUrl;

  User? user;
  String? UserID;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
    UserID = user?.uid;
  }

  uploadImageToFireStore(File image, String imageName) async {
    Reference ref =
        _storage.ref().child('patients/${_auth.currentUser!.uid}$imageName');
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    await ref.putFile(image, metadata);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImage() async {
    _getUser();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        file = File(pickedFile.path);
      });
    }
    profileUrl = await uploadImageToFireStore(file!, 'doc');
    FirebaseFirestore.instance.collection('patient').doc(UserID).set({
      'image': profileUrl,
    }, SetOptions(merge: true));
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
        backgroundColor: AppColors.color1,
        elevation: 0,
        title: const Text(
          'الحساب الشخصي',
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.settings,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => const UserSettings()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('doctor')
                .doc(UserID)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var userData = snapshot.data;
              print(userData!['name']);
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: AppColors.white,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    radius: 60,
                                    backgroundImage: (userData['image'] != null)
                                        ? NetworkImage(userData['image'])
                                            as ImageProvider
                                        : const AssetImage('assets/doc.png'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "د. ${userData['name']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: getTitleStyle(),
                                  ),
                                  Text(
                                    userData['specialization'],
                                    style: getbodyStyle(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        userData['rating'].toString(),
                                        style: getbodyStyle(),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Icon(
                                        Icons.star_rounded,
                                        size: 20,
                                        color: Colors.orange,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      IconTile(
                                        onTap: () {},
                                        backColor: AppColors.scaffoldBG,
                                        imgAssetPath: Icons.phone,
                                        num: '1',
                                      ),
                                      if (userData['phone2'] != null)
                                        IconTile(
                                          onTap: () {},
                                          backColor: AppColors.scaffoldBG,
                                          imgAssetPath: Icons.phone,
                                          num: '2',
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "نبذه تعريفية",
                          style: getbodyStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userData['bio'],
                          style: getsmallStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.scaffoldBG,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TileWidget(
                                  text:
                                      '${userData['openHour']} - ${userData['closeHour']}',
                                  icon: Icons.watch_later_outlined),
                              const SizedBox(
                                height: 15,
                              ),
                              TileWidget(
                                  text: userData['address'],
                                  icon: Icons.location_on_rounded),
                            ],
                          ),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "معلومات الاتصال",
                          style: getbodyStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.scaffoldBG,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TileWidget(
                                  text: userData['email'], icon: Icons.email),
                              const SizedBox(
                                height: 15,
                              ),
                              TileWidget(
                                  text: userData['phone1'], icon: Icons.call),
                              const SizedBox(
                                height: 15,
                              ),
                              if (userData['phone2'] != null)
                                TileWidget(
                                    text: userData['phone2'], icon: Icons.call),
                            ],
                          ),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "حجوزاتي",
                          style: getbodyStyle(fontWeight: FontWeight.w600),
                        ),
                        const AppointmentHistoryList()
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
