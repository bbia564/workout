import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kooking/pages/record/record_controller.dart';
import 'package:kooking/res/style.dart';

import '../../entity/exercise_bean.dart';


class RecordPage extends GetView<RecordController> {
  const RecordPage({super.key});

  @override

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 252.h,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD0E2FF), Color(0xFFF8F8F8)])),
        ),
        Column(
          children: [
            SizedBox(
              height: context.mediaQueryPadding.top + 20,
              width: double.infinity,
            ),
            Text(
              "Project records",
              style: TextStyle(
                  fontSize: 16.sp, color: const Color(0xFF0F0F0F), fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Obx(() => _buildListView()),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
      shrinkWrap: true,
      itemCount: controller.recordList.length,
      itemBuilder: (context, index) {
        final bean = controller.recordList[index];
        return _buildItem(bean);
      },
      separatorBuilder: (BuildContext context, int index) {
        return 10.verticalSpace;
      },
    );
  }

  Widget _buildItem(ExerciseBean bean) {
    return Container(
      decoration: AppStyle.defDecoration,
      padding: REdgeInsets.symmetric(horizontal: 16,vertical: 7),
      child: Row(
        children: [
          Image.asset(
            "assets/images/image_${bean.name}.png",
            width: 86.w,
          ),
          17.horizontalSpace,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bean.name.toUpperCase(),
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w700, color: const Color(0xFF0F0F0F)),
              ),
              Text(
                "exercise duration：${bean.duration} Hour",
                style: TextStyle(
                    fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF0F0F0F)),
              ),
              Text(
                bean.createdAt,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF0F0F0F).withOpacity(0.4)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
