import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'set_controller.dart';

class SettingPage extends GetView<SetController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300.h,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD0E2FF), Color(0xFFF8F8F8)])),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 20),
              child: Center(
                child: Text(
                  "Setting",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 14, left: 16.w, right: 16.w, bottom: 30.h),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text("Investment Record",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp)),
                      contentPadding: const EdgeInsets.only(left: 16, right: 10),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFFAAAAAA),
                        size: 16,
                      ),
                      onTap: () {
                        controller.onRecord();
                      },
                    ),
                    const Divider(
                      height: 1,
                      indent: 17,
                      endIndent: 17,
                    ),
                    ListTile(
                      title: Text("Clean Data",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp)),
                      contentPadding: const EdgeInsets.only(left: 16, right: 10),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFFAAAAAA),
                        size: 16,
                      ),
                      onTap: () {
                        controller.onCleanData();
                      },
                    ),
                    const Divider(
                      height: 1,
                      indent: 17,
                      endIndent: 17,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text("Version",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: const Color(0xFF343434))),
                          ),
                          Obx(() => Text(
                                "V${controller.version.value}",
                                style: TextStyle(
                                  color: const Color(0xFFB1B1B1),
                                  fontSize: 14.sp,
                                ),
                              ))
                        ],
                      ),
                      contentPadding: const EdgeInsets.only(left: 16, right: 10),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFFAAAAAA),
                        size: 16,
                      ),
                      onTap: () {},
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
