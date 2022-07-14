part of 'calendar_bloc.dart';

@immutable
abstract class CalendarState {}

class CalendarInitial extends CalendarState {
 final DateTime selectedDay;
 final DateTime focusedDay;

  CalendarInitial({required this.focusedDay,required this.selectedDay});
}
