import 'package:bmi_calculator_28_12/colors.dart';
import 'package:bmi_calculator_28_12/home_view.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.res});
  final double res;

// Severe Thinness	< 16
// Moderate Thinness	16 - 17
// Mild Thinness	17 - 18.5
// Normal	18.5 - 25
// Overweight	25 - 30
// Obese Class I	30 - 35
// Obese Class II	35 - 40
// Obese Class III	> 40
  String getClass() {
    if (res < 16) {
      return 'Severe Thinness';
    } else if (res >= 16 && res < 17) {
      return 'Moderate Thinness';
    } else if (res >= 18.5 && res < 25) {
      return 'Normal';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: AppColors.scaffoldBg,
        elevation: 0.0,
        foregroundColor: AppColors.whiteColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getClass(),
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Result is :',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                res.toStringAsFixed(2),
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ));
                      },
                      child: Text(
                        'RE-CALCULATE',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
