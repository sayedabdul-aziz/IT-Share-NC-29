import 'package:bmi_calculator_28_12/colors.dart';
import 'package:bmi_calculator_28_12/result_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int height = 160;
  int age = 19;
  int weight = 60;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        elevation: 0,
        centerTitle: true,
        title: Text('BMI Calculator App',
            style: TextStyle(color: AppColors.whiteColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            /// ----------- Male & Female -----------------
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (isMale)
                            ? AppColors.redColor
                            : AppColors.containerBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 80,
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (isMale)
                            ? AppColors.containerBg
                            : AppColors.redColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 80,
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),

            /// ----------- Height -----------------
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: AppColors.containerBg,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$height CM',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 130,
                        max: 210,
                        activeColor: AppColors.redColor,
                        inactiveColor: AppColors.buttonColor,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),

            // --------- Weight & age ----------------------
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.containerBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              color: AppColors.buttonColor,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$weight KG',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.whiteColor),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: const Icon(Icons.remove)),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.whiteColor),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: const Icon(Icons.add))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.containerBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              color: AppColors.buttonColor,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.whiteColor),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: const Icon(Icons.remove)),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.whiteColor),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: const Icon(Icons.add))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),

            // ------------ Button ------------------------
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
                      double res = weight / (height * .01 * height * .01);
                      // navigation to a new screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultView(res: res),
                      ));
                    },
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor),
                    )))
          ],
        ),
      ),
    );
  }
}
