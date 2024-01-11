import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app_1_1/core/functions/routing.dart';
import 'package:taskati_app_1_1/core/model/task_model.dart';
import 'package:taskati_app_1_1/core/utils/app_colors.dart';
import 'package:taskati_app_1_1/core/utils/text_styles.dart';
import 'package:taskati_app_1_1/core/widgets/custom_button.dart';
import 'package:taskati_app_1_1/featuers/home/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var titleCon = TextEditingController();
  var noteCon = TextEditingController();
  var formKey = GlobalKey<FormState>();

  DateTime date = DateTime.now();
  var startTime = DateFormat('hh:mm a').format(DateTime.now());
  var endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));

  int colorIndex = 0;
  late Box<TaskModel> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('task');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // to make the keyboard on screen
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: getTitleStyle(color: AppColors.blackColor)),
              const Gap(7),
              TextFormField(
                controller: titleCon,
                decoration: const InputDecoration(
                  hintText: 'Enter title Here',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title is required*';
                  }
                  return null;
                },
              ),
              // ---- note ---------
              const Gap(10),
              Text('Note', style: getTitleStyle(color: AppColors.blackColor)),
              const Gap(7),
              TextFormField(
                controller: noteCon,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Enter Note Here',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note is required*';
                  }
                  return null;
                },
              ),

              const Gap(10),
              // ---- date ----------
              Text('Date', style: getTitleStyle(color: AppColors.blackColor)),
              const Gap(7),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: DateFormat.yMd().format(date),
                    hintStyle: getBodyStyle(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          getTaskDate();
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.primaryColor,
                        ))),
              ),

              const Gap(10),
              // ------------- start and end time
              Row(
                children: [
                  Expanded(
                      child: Text('Start Time',
                          style: getTitleStyle(color: AppColors.blackColor))),
                  const Gap(10),
                  Expanded(
                      child: Text('End Time',
                          style: getTitleStyle(color: AppColors.blackColor))),
                ],
              ),
              const Gap(7),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: startTime,
                          hintStyle: getBodyStyle(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                getTaskStartTime();
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: AppColors.primaryColor,
                              ))),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: endTime,
                          hintStyle: getBodyStyle(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                getTaskEndTime();
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: AppColors.primaryColor,
                              ))),
                    ),
                  ),
                ],
              ),

              const Gap(20),

              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            colorIndex = 0;
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.primaryColor,
                          child: colorIndex == 0
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.whiteColor,
                                )
                              : const SizedBox(),
                        ),
                      ),
                      const Gap(5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            colorIndex = 1;
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.orangeColor,
                          child: colorIndex == 1
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.whiteColor,
                                )
                              : const SizedBox(),
                        ),
                      ),
                      const Gap(5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            colorIndex = 2;
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.redColor,
                          child: colorIndex == 2
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.whiteColor,
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                      width: 140,
                      style: getSmallStyle(color: AppColors.whiteColor),
                      text: 'Create Task',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          String id =
                              '${titleCon.text}$startTime${DateTime.now().millisecond}';
                          box.put(
                              id,
                              TaskModel(
                                  id: id,
                                  title: titleCon.text,
                                  note: noteCon.text,
                                  date: date.toIso8601String(),
                                  startTime: startTime,
                                  endTime: endTime,
                                  color: colorIndex,
                                  isCompleted: false));

                          pushToWithReplacment(context, const HomeView());
                        }
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTaskDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value != null) {
        setState(() {
          date = value;
        });
      }
    });
  }

  getTaskStartTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        setState(() {
          startTime = value.format(context);
          // to add time for end time auto after selecting the start time ----------
          endTime = value
              .replacing(hour: value.hour + 1, minute: value.minute + 15)
              .format(context);
        });
      }
    });
  }

  getTaskEndTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        setState(() {
          endTime = value.format(context);
        });
      }
    });
  }
}
