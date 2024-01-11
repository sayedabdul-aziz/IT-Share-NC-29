import 'package:flutter/material.dart';
import 'package:taskati_app_1_1/core/functions/routing.dart';
import 'package:taskati_app_1_1/core/utils/text_styles.dart';
import 'package:taskati_app_1_1/core/widgets/custom_button.dart';
import 'package:taskati_app_1_1/featuers/add-task/add_task_view.dart';

import '../../../core/utils/app_colors.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: getTitleStyle(fontSize: 16, color: AppColors.blackColor),
            ),
            Text(
              'Today',
              style: getTitleStyle(fontSize: 16, color: AppColors.blackColor),
            )
          ],
        ),
        const Spacer(),
        CustomButton(
            width: 130,
            style: getSmallStyle(color: AppColors.whiteColor),
            text: '+ Add Task',
            onPressed: () {
              pushTo(context, const AddTaskView());
            })
      ],
    );
  }
}
