import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/logics/calaneder/calendar_bloc.dart';
import 'package:schedule_app/logics/getdatabydate/getdatabydate_bloc.dart';
import 'package:schedule_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 738.1818181818181),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create:(context) => CalendarBloc()),
              BlocProvider(create:(context) => GetdatabydateBloc()),
            ],
            child: MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(color: Color(0xff000000)),
                  ),
                  fontFamily: 'Euclid Circular B',
                ),
                home: const HomeScreen()),
          );
        });
  }
}
