import 'package:table_calendar/table_calendar.dart';

import '../../../app_config.dart';

class WorkoutCalendar extends StatelessWidget {
  final DateTime dateTime;
  final OnDaySelected onDaySelected;

  const WorkoutCalendar({super.key, required this.dateTime, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      rowHeight: 72,
      lastDay: DateTime.utc(dateTime.year + 300, 12, 31),
      focusedDay: dateTime,

      calendarFormat: CalendarFormat.week,

      // When a day is selected
      selectedDayPredicate: (day) => isSameDay(dateTime, day),
      onDaySelected: onDaySelected,

      // Hide headers & format the week strip style
      headerVisible: false,
      daysOfWeekVisible: false,

      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        cellMargin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        cellPadding: EdgeInsets.zero,
        defaultDecoration: BoxDecoration(
          color: AppColors.lightGrey.withValues(alpha: .17),
          borderRadius: BorderRadius.circular(40),
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.primaryColor,
          // your brown highlight color
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: AppColors.lightGrey.withValues(alpha: .17),
          borderRadius: BorderRadius.circular(40),
        ),
        defaultTextStyle: const TextStyle(color: Colors.black),
        selectedTextStyle: const TextStyle(color: Colors.white),
        todayTextStyle: const TextStyle(color: Colors.black),
      ),

      // Custom day builder for weekday + date layout
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return CommonClass.buildDayCell(day, false);
        },
        selectedBuilder: (context, day, focusedDay) {
          return CommonClass.buildDayCell(day, true);
        },
        todayBuilder: (context, day, focusedDay) {
          return CommonClass.buildDayCell(day, false);
        },
        disabledBuilder: (context, day, focusedDay) {
          return CommonClass.buildDayCell(day, false);
        },
        outsideBuilder: (context, day, focusedDay) {
          return CommonClass.buildDayCell(day, false);
        },
      ),
    );
  }
}
