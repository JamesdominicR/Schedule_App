import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:schedule_app/core/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants.dart';
import 'package:schedule_app/model/schedule_model.dart';
class TableWidget extends StatelessWidget {
  const TableWidget({
    Key? key, required this.dataList,//required this.endTime,required this.name//
  }) : super(key: key);
  final Datum dataList;
  // final Datum endTime;
  // final Datum name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 74,
                width: 45,
                color: kblueColor,
                  child: Center(
                    child: SvgPicture.asset('assets/images/Icon.svg'),
                  ),
                )
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 12,bottom: 8),
                //Creating the time and routine
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text( dataList.startTime+'-'+dataList.endTime,
                      style: timeStyle),
                    Text(dataList.name,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ],
                ),
              ),   
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: DottedLine(
            lineLength: 40,
            direction: Axis.vertical,
            dashLength: 4,
            dashColor: kbuttonColor,
            lineThickness: 2.0,
          ),
        )
       
      ],
    );
  }
}