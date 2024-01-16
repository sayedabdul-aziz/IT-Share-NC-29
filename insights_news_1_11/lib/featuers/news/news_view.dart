import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';
import 'package:insights_news_1_11/featuers/news/widgets/news_header.dart';
import 'package:insights_news_1_11/featuers/news/widgets/news_list.dart';
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
        child: DefaultTabController(
          length: 4,
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
              ),

              const Gap(20),
              // butn tabbar
              ButtonsTabBar(
                  backgroundColor: AppColors.lemonadaColor,
                  unselectedBackgroundColor: AppColors.containerBg,
                  labelStyle: getBodyStyle(color: AppColors.scaffoldBg),
                  unselectedLabelStyle: getBodyStyle(color: AppColors.white),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  buttonMargin: const EdgeInsets.only(right: 15),
                  tabs: const [
                    Tab(
                      text: 'Science',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ]),

              // views

              const Gap(10),
              const Expanded(
                  child: TabBarView(children: [
                NewsListBuilder(category: 'Science'),
                NewsListBuilder(category: 'Entertainment'),
                NewsListBuilder(category: 'Sports'),
                NewsListBuilder(category: 'Business'),
              ]))
            ],
          ),
        ),
      ),
    ));
  }
}
