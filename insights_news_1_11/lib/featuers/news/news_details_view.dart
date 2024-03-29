import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_1_11/core/news_model/article.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.model});
  final Article model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.white,
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: AppColors.containerBg,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: (model.urlToImage == null)
                    ? Center(
                        child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Icon(
                              Icons.error,
                              color: AppColors.white,
                            )))
                    : Image.network(
                        model.urlToImage,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      )),
            const Gap(10),
            Text(
              model.title ?? '',
              style: getTitleStyle(fontSize: 16, color: AppColors.white),
            ),
            const Gap(10),
            Text(
              model.publishedAt!.split('T').first,
              style: getSmallStyle(fontSize: 12, color: AppColors.white),
            ),
            const Gap(10),
            Text(
              model.author ?? '',
              style: getBodyStyle(fontSize: 14, color: AppColors.lemonadaColor),
            ),
            const Gap(10),
            Text(
              model.description ?? '',
              style: getBodyStyle(
                  fontSize: 16, color: AppColors.white.withOpacity(.7)),
            ),
            const Gap(10),
            Text(
              model.source!.name ?? '',
              style: getBodyStyle(fontSize: 14, color: AppColors.lemonadaColor),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lemonadaColor,
                  foregroundColor: AppColors.scaffoldBg,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () async {
                await launchUrl(Uri.parse('geo:30.0444,31.1'));
              },
              child: const Text('GO TO WEBSITE')),
        ),
      ),
    );
  }
}
