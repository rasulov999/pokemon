import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/presentation/utils/colors.dart';

class GridContainer extends StatelessWidget {
  GridContainer(
      {super.key,
      required this.imgName,
      required this.name,
      required this.num,
      required this.onTap});
  String imgName;
  String name;
  String num;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          color: MyColors.c_FA5AFD,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 48.w,
              right: 46.w,
              top: -40.h,
              child: Image.network(
                imgName,
                width: 200.w,
                height: 200.h,
              ),
            ),
            Positioned(
              left: 16.w,
              right: 14.w,
              top: 150.h,
              child: gridItems(num, name),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridItems(String num, String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h).r,
      width: 147.w,
      height: 27.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: MyColors.c_676767,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '#$num',
            style: TextStyle(
              color: MyColors.c_F993FB,
              fontSize: 12.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: MyColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
