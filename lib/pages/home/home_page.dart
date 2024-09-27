import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kooking/pages/home/home_controller.dart';
import 'package:kooking/res/style.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

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
              "All Projects",
              style: TextStyle(
                  fontSize: 16.sp, color: const Color(0xFF0F0F0F), fontWeight: FontWeight.w700),
            ),
            20.verticalSpace,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(vertical: 30.w),
              decoration: BoxDecoration(
                  color: const Color(0xFF4B8CF5), borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  Expanded(
                      child: Obx(() => _statisticsItem(
                          "Total duration", "${controller.durationTotal.value} H"))),
                  Expanded(
                      child: Obx(() => _statisticsItem(
                          "Total investment", "${controller.consumptionTotal.value}"))),
                  SizedBox(
                    height: 51.5.h,
                    child: VerticalDivider(width: 0, color: Colors.white.withOpacity(0.17)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 14.h),
              child: Row(
                children: [
                  Text(
                    "Project Selection",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xFF0F0F0F),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder(
                id: "gridView",
                init: controller,
                builder: (HomeController controller) {
                  return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 12,
                        childAspectRatio: 140 / 130,
                        maxCrossAxisExtent:200,
                      ),
                      itemCount: controller.projects.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _projectItem(controller.projects[index]);
                      });
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _statisticsItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.white),
        ),
        6.verticalSpace,
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27.sp, color: Colors.white),
        ),
      ],
    );
  }

  Widget _projectItem(Map<String, String> item) {
    return InkWell(
      onTap: () {
        controller.select(item["name"] ?? "");
      },
      child: Container(
        decoration: AppStyle.defDecoration,
        child: Column(
          children: [
            Image.asset(
              item["image"] ?? "",
              width: 86.w,
            ),
            6.verticalSpace,
            Text(
              item["name"]?.toUpperCase() ?? "",
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp, color: const Color(0xFF0F0F0F)),
            ),
            6.verticalSpace,
            Text(
              "Investment:" + item["price"]!,
              style:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
