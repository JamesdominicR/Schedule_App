import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';

class TimeMenu extends StatelessWidget {
  final String title;
  final String time;
  const TimeMenu({Key? key, required this.time, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  )),
             const Spacer(),
              Text(
                time,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: kbuttonColor,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {},
              )
            ],
          ),
        ),
       const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Divider(
            // thickness: 0.5,
            color: ktextColor,
          ),
        ),
      ],
    );
  }
}
