import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial(focusedDay: DateTime(2022,6,1),selectedDay: DateTime(2022,6,30))) {
    on<OnFormatChanged>((event, emit) {
      // print("${event.focusedDay}  ${event.selectedDay}");
      
     emit(CalendarInitial(focusedDay: event.focusedDay,selectedDay: event.selectedDay));
    });
  }
}
