import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/presentation/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({super.key,required this.width});
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 42.h,
      decoration: BoxDecoration(
        color:  Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextField(
        decoration: InputDecoration(
           border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: MyColors.c_838282),alignLabelWithHint: true,
          hintText: "Search Pokemon"
        ),
      ),
    );
  }
}
