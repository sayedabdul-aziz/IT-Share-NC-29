import 'package:flutter/material.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';

class SourceView extends StatelessWidget {
  const SourceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sources'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.containerBg),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/rodri.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Spacer(),
                    Text(
                      'ESPN',
                      style: getBodyStyle(),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
