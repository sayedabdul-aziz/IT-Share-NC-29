import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app_1_1/core/model/task_model.dart';
import 'package:taskati_app_1_1/core/utils/app_colors.dart';
import 'package:taskati_app_1_1/core/utils/text_styles.dart';
import 'package:taskati_app_1_1/featuers/home/widgets/home_header.dart';
import 'package:taskati_app_1_1/featuers/home/widgets/task_item.dart';
import 'package:taskati_app_1_1/featuers/home/widgets/today_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var date = DateFormat.yMMMMd().format(DateTime.now());

  var _selectedDate = DateTime.now().toIso8601String();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(20),
              // Date
              TodayHeaderWidget(date: date),
              const Gap(20),

              // Date TimeLine -------------
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedDate = date.toIso8601String();
                  });
                },
              ),
              const Gap(15),
              // Tasks List -------------
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: Hive.box<TaskModel>('task').listenable(),
                  builder: (context, box, child) {
                    List<TaskModel> tasks = [];
                    for (var element in box.values) {
                      if (_selectedDate.split('T').first ==
                          element.date.split('T').first) {
                        tasks.add(element);
                      }
                    }
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.startToEnd) {
                                //--- complete

                                box.put(
                                    tasks[index].id,
                                    TaskModel(
                                        id: tasks[index].id,
                                        title: tasks[index].title,
                                        note: tasks[index].note,
                                        date: tasks[index].date,
                                        startTime: tasks[index].startTime,
                                        endTime: tasks[index].endTime,
                                        color: 3,
                                        isCompleted: true));
                              } else {
                                //--- delete

                                box.delete(tasks[index].id);
                              }
                            },
                            background: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.green,
                              child: Row(
                                children: [
                                  Text('Complete Task',
                                      style: getTitleStyle(
                                          color: AppColors.whiteColor)),
                                ],
                              ),
                            ),
                            secondaryBackground: Container(
                              padding: const EdgeInsets.all(10),
                              color: AppColors.redColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Delete Task',
                                    style: getTitleStyle(
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                            child: TaskItemWidget(task: tasks[index]));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
