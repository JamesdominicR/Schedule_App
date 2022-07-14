import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/core/colors.dart';
import 'package:schedule_app/core/constants.dart';
import 'package:schedule_app/logics/calaneder/calendar_bloc.dart';
import 'package:schedule_app/logics/getdatabydate/getdatabydate_bloc.dart';
import 'package:schedule_app/screens/widgets/button_widget.dart';
import 'package:schedule_app/screens/widgets/table_widget.dart';
import 'package:schedule_app/screens/widgets/time_menu_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetdatabydateBloc>().add(DataInitial());
    super.initState();
  }
  CalendarFormat _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'JUNE 2022',
          style: TextStyle(
            fontSize: 22.sp,
            color: ktextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            state as CalendarInitial;
            return Column(
              children: [
                TableCalendar(
                  currentDay: state.selectedDay,
                  firstDay: DateTime.utc(2022, 06, 01),
                  lastDay: DateTime(2022, 6, 30),
                  calendarFormat: _calendarFormat,
                  headerVisible: false,
                  focusedDay: state.focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(state.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    context.read<CalendarBloc>().add(OnFormatChanged(
                        focusedDay: focusedDay, selectedDay: selectedDay));
                  },
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: true,
                    formatButtonTextStyle: TextStyle(
                      fontSize: 15,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: BlocBuilder<GetdatabydateBloc, GetdatabydateState>(
                    builder: (context, state) {
                      if(state is GetdatabydateSucess){
                      return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kwhiteShade,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 25),
                            child: ListView.builder(
                                itemCount: state.model.data.length,
                                itemBuilder: (context, index) => TableWidget(dataList: state.model.data[index])),
                          ));
                      }else{
                        return Center(child: Text('Loading',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        ),);
                      }
                      
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30.sp,
        ),
        onPressed: () {
          _bottomsheet(context);
        },
      ),
    );
  }

  _bottomsheet(context) {
    showModalBottomSheet(
        // backgroundColor: const Color(0xffB4AFEF),
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (BuildContext c) {
          return Wrap(children: [
            const ListTile(
              title: Text(
                'Add Schedule',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kbuttonColor,
                ),
              ),
              trailing: Icon(Icons.close),
            ),
            const SizedBox(height: 10),
            //
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: styleCategory,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Date&Time',
                        style: styleCategory,
                      ),
                      Container(
                          width: 370.w,
                          height: 240.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: kwhiteShade,
                          ),
                          child: Column(
                            children: const [
                              TimeMenu(
                                title: 'Start Time',
                                time: '9AM',
                              ),
                              TimeMenu(
                                title: 'Start Time',
                                time: '9AM',
                              ),
                              TimeMenu(
                                title: 'Start Time',
                                time: '9AM',
                              ),
                            ],
                          )),
                      SizedBox(height: 30.h),
                      ButtonWidget(title: 'Add Schedule', ontap: () {}),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            )
          ]);
        });
  }
}

