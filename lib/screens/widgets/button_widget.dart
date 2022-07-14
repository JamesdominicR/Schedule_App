import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/colors.dart';
class ButtonWidget extends StatelessWidget {
  final String title;
  final ontap;
  const ButtonWidget({
    Key? key,required this.title,required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kbuttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 20),
      ),
     
      child: Text(title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      ),
      onPressed: ontap,
    );
  }
}
