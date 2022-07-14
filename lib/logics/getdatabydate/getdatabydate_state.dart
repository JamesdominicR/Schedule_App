part of 'getdatabydate_bloc.dart';
@immutable
abstract class GetdatabydateState {}

class GetdatabydateInitial extends GetdatabydateState {}
class GetdatabydateOnProcess extends GetdatabydateState {}
class GetdatabydateSucess extends GetdatabydateState {
final ScheduleModel model;

  GetdatabydateSucess(this.model);  
}
