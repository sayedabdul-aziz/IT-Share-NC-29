import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/featuers/news/widgets/news_header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int curruntIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const HomeHeaderWidget(),
            // slider
            const Gap(25),
            CarouselSlider.builder(
                itemCount: 5,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/rodri.jpg', fit: BoxFit.cover),
                  );
                },
                options: CarouselOptions(
                  height: 170,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      curruntIndex = index;
                    });
                  },
                )),
            const Gap(15),
            SmoothPageIndicator(
              controller: PageController(initialPage: curruntIndex),
              count: 5,
              axisDirection: Axis.horizontal,
              effect: ScrollingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                dotColor: Colors.grey,
                activeDotColor: AppColors.lemonadaColor,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
