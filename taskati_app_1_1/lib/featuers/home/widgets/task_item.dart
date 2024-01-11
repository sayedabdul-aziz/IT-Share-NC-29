import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app_1_1/core/model/task_model.dart';
import 'package:taskati_app_1_1/core/utils/app_colors.dart';
import 'package:taskati_app_1_1/core/utils/text_styles.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: task.color == 0
              ? AppColors.primaryColor
              : task.color == 1
                  ? AppColors.orangeColor
                  : task.color == 2
                      ? AppColors.redColor
                      : Colors.green,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: getTitleStyle(color: AppColors.whiteColor),
              ),
              const Gap(10),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.whiteColor,
                  ),
                  const Gap(5),
                  Text(
                    '${task.startTime} : ${task.endTime}',
                    style: getSmallStyle(
                      color: AppColors.whiteColor,
                    ),
                  )
                ],
              ),
              const Gap(10),
              Text(
                task.note,
                style: getBodyStyle(color: AppColors.whiteColor),
              ),
            ],
          ),
          const Spacer(),
          Container(
            color: AppColors.whiteColor,
            width: .5,
            height: 80,
          ),
          const Gap(10),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.isCompleted ? 'Completed' : 'TODO',
              style: getTitleStyle(fontSize: 14, color: AppColors.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
