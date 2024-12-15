import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../widgets/buttons/custom_toggle_button.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    this.onDateSelected,
    this.initialDate,
    this.isShowAdjacentDays = false,
  });

  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;
  final bool isShowAdjacentDays;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _currentMonth = widget.initialDate ?? DateTime.now();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  List<DateTime> _getDaysInMonth(DateTime month) {
    final first = DateTime(month.year, month.month, 1);
    final daysBefore = first.weekday - 1;
    final firstToDisplay = first.subtract(Duration(days: daysBefore));
    final last = DateTime(month.year, month.month + 1, 0);
    final daysAfter = 7 - last.weekday;
    final lastToDisplay = last.add(Duration(days: daysAfter));
    return List.generate(
      lastToDisplay.difference(firstToDisplay).inDays + 1,
      (index) => firstToDisplay.add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        return Container(
          decoration: BoxDecoration(
            color: colors(context).background,
            borderRadius: const BorderRadius.all(
              Radius.circular(14.0),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMMM yyyy').format(_currentMonth),
                        style: TextStyle(
                          color: colors(context).parametersTextColor,
                          fontSize: 24.toResponsive(maxWidth),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: colors(context).statisticsTextLabel,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentMonth = DateTime(
                              _currentMonth.year,
                              _currentMonth.month - 1,
                            );
                          });
                        },
                      ),
                      const Gap(26.0),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          color: colors(context).statisticsTextLabel,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentMonth = DateTime(
                              _currentMonth.year,
                              _currentMonth.month + 1,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                  const Gap(24.0),
                  CustomToggleButton(
                    options: const ['Week', 'Month'],
                    height: 37.0,
                    background: colors(context).calendarToggleBackground,
                    color: AppColors.secondary.red,
                    textStyleSelected: AppTypography.title16b.copyWith(
                      color: AppColors.white,
                      fontSize: 16.toResponsive(maxWidth),
                    ),
                    textStyleNoSelected: AppTypography.title16b.copyWith(
                      color: colors(context).parametersTextColor,
                      fontSize: 16.toResponsive(maxWidth),
                    ),
                  ),
                  const Gap(24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DefaultTextStyle(
                      style: AppTypography.title16m.copyWith(
                        fontSize: 16.toResponsive(maxWidth),
                        color: colors(context).calendarDaysOfWeek,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Mon'),
                          Text('Tue'),
                          Text('Wed'),
                          Text('Thu'),
                          Text('Fri'),
                          Text('Sat'),
                          Text('Sun'),
                        ],
                      ),
                    ),
                  ),
                  const Gap(16.0),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 7,
                    children: _getDaysInMonth(_currentMonth).map((date) {
                      bool isSelected = date.year == _selectedDate.year &&
                          date.month == _selectedDate.month &&
                          date.day == _selectedDate.day;
                      bool isCurrentMonth = date.month == _currentMonth.month;

                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(128),
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: isCurrentMonth
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.transparent,
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.secondary.red
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    if (isSelected)
                                      BoxShadow(
                                        color: AppColors.rangeColor
                                            .withOpacity(0.4),
                                        spreadRadius: 0,
                                        blurRadius: 20,
                                        offset: const Offset(0, 6),
                                      ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    '${date.day}',
                                    style: TextStyle(
                                      fontSize: 16.toResponsive(maxWidth),
                                      color: !isCurrentMonth
                                          ? widget.isShowAdjacentDays
                                              ? Colors.grey
                                              : Colors.transparent
                                          : isSelected
                                              ? AppColors.gray.white
                                              : colors(context).calendarDays,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.isShowAdjacentDays ||
                                  date.month == _currentMonth.month) {
                                setState(() {
                                  _selectedDate = date;
                                });
                                if (widget.onDateSelected != null) {
                                  widget.onDateSelected!(date);
                                }
                              }
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
