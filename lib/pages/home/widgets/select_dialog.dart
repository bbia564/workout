import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kooking/res/style.dart';

class SelectDialog extends StatelessWidget {
  const SelectDialog({super.key, required this.selectAction});

  final ValueChanged<int> selectAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: AppStyle.defDecoration,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                selectAction.call(1);
              },
              title: Text(
                "Record Workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color(0xFF4B8CF5)),
              ),
            ),
            ListTile(
              onTap: () {
                selectAction.call(2);
              },
              title: Text(
                "Record Input",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color(0xFF4B8CF5)),
              ),
            ),
            const Divider(
              indent: 16,
              endIndent: 16,
              height: 1,
            ),
            const Divider(
              indent: 16,
              endIndent: 16,
              height: 1,
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              title: Text(
                "Cancel",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xFF0F0F0F).withOpacity(0.7)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
