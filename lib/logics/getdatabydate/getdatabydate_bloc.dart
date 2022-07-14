import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/model/schedule_api.dart';
import 'package:schedule_app/model/schedule_model.dart';
part 'getdatabydate_event.dart';
part 'getdatabydate_state.dart';

class GetdatabydateBloc extends Bloc<GetdatabydateEvent, GetdatabydateState> {
  GetdatabydateBloc() : super(GetdatabydateInitial()) {
    // add(DataInitial());
    on<DataInitial>((event, emit) async{
      emit(GetdatabydateOnProcess());
      final data = await ScheduleApi().getData(id: "9605485942");
      emit(GetdatabydateSucess(data!));

  
    });
  }
}
