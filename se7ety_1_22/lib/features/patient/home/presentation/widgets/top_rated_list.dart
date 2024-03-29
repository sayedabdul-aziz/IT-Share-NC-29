import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se7ety_1_22/core/widgets/doctor_card.dart';
import 'package:se7ety_1_22/features/patient/search/presentaion/view/doctor_profile.dart';

class TopRatedList extends StatefulWidget {
  const TopRatedList({super.key});

  @override
  _TopRatedListState createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('doctor')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              // make listview scroll with single child scroll view
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doctor = snapshot.data!.docs[index];
                if (doctor['name'] == null ||
                    doctor['image'] == null ||
                    doctor['specialization'] == null ||
                    doctor['rating'] == null) {
                  return const SizedBox();
                }
                return DoctorCard(
                    name: doctor['name'],
                    image: doctor['image'],
                    specialization: doctor['specialization'],
                    rating: doctor['rating'],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorProfile(
                            email: doctor['email'],
                          ),
                        ),
                      );
                    });
              },
            );
          }
        },
      ),
    );
  }
}
