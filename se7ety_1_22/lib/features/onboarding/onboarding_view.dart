import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_1_22/core/functions/routing.dart';
import 'package:se7ety_1_22/core/utils/colors.dart';
import 'package:se7ety_1_22/core/utils/styles.dart';
import 'package:se7ety_1_22/features/onboarding/onboarding_model.dart';
import 'package:se7ety_1_22/features/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageCon = PageController();
  int curruntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          TextButton(
              onPressed: () {
                pushToWithReplacement(context, const WelcomeView());
              },
              child: Text(
                'تخطي',
                style: getbodyStyle(color: AppColors.color1),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // PAGE VIEW

            Expanded(
              child: PageView.builder(
                controller: pageCon,
                itemCount: 3,
                onPageChanged: (value) {
                  setState(() {
                    curruntIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(model[index].image, width: 300),
                      const Gap(50),
                      Text(
                        model[index].title,
                        style: getTitleStyle(color: AppColors.color1),
                      ),
                      const Gap(30),
                      Text(
                        model[index].desc,
                        style: getbodyStyle(),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  );
                },
              ),
            ),

            // indicator and btn

            SizedBox(
              height: 60,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageCon,
                    count: 3,
                    effect: WormEffect(
                        dotWidth: 20,
                        dotHeight: 10,
                        activeDotColor: AppColors.color1),
                  ),
                  const Spacer(),
                  if (curruntIndex == 2)
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.color1,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          pushToWithReplacement(context, const WelcomeView());
                        },
                        child: Text(
                          'هيابنا',
                          style: getbodyStyle(color: AppColors.white),
                        ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
