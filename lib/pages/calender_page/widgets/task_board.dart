import 'package:car_dashboard/pages/calender_page/widgets/task_board_date_buttons.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common/row_scrollable.dart';
import 'task_board_date.dart';
import 'task_board_dropdown.dart';
import 'task_board_planer2.dart';

class TaskBoard extends StatefulWidget {
  const TaskBoard({super.key});

  @override
  State<TaskBoard> createState() => _TaskBoardState();
}

class _TaskBoardState extends State<TaskBoard> {
  final List<String> dropdownItems = [];
  DateTime dateTime = DateTime.now();

  void onTapLeft() {
    setState(() {
      dateTime = dateTime.subtract(
        const Duration(
          days: 1,
        ),
      );
    });
  }

  void onTapRight() {
    setState(() {
      dateTime = dateTime.add(
        const Duration(
          days: 1,
        ),
      );
    });
  }

  void onChangeDateTime(DateTime newDateTime) {
    setState(() {
      dateTime = newDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondary.blue,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20.0,
            ),
            child: RowScrollable(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TaskBoardDropdown(
                  backgroundColor: AppColors.secondary.onBlue,
                ),
                TaskBoardDate(
                  dateTime: dateTime,
                  onChangeDateTime: (newDateTime) =>
                      onChangeDateTime(newDateTime),
                ),
                TaskBoardDateButtons(
                  onTapLeft: onTapLeft,
                  onTapRight: onTapRight,
                ),
              ],
            ),
          ),
        ),
        // TaskBoardPlaner(),
        TaskBoardPlaner2(),
        // TaskBoardPlaner3(),
      ],
    );
  }
}
