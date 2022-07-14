part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent {}
class OnFormatChanged extends CalendarEvent{
 final DateTime focusedDay;
 final DateTime selectedDay;
 

  OnFormatChanged({required this.focusedDay,required this.selectedDay});
}
