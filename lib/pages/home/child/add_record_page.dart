import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kooking/pages/home/child/add_controller.dart';
import 'package:kooking/res/style.dart';

class AddRecordPage extends GetView<AddController> {
  const AddRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: AppStyle.defDecoration,
          margin: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
          padding: REdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/image_${controller.projectName}.png",
                    width: 86.w,
                  ),
                  17.horizontalSpace,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.projectName.toUpperCase(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0F0F0F)),
                      ),
                      Text(
                        "Last record：",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF0F0F0F).withOpacity(0.6)),
                      )
                    ],
                  ))
                ],
              ),
              const Divider(
                endIndent: 8,
                indent: 8,
                height: 1,
              ),
              if (controller.type == 2)
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  leading: Text("Hourly unit price",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF0F0F0F),
                          fontWeight: FontWeight.w400)),
                  title: TextField(
                    controller: controller.hourPriceEdit,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                        hintText: "input",
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF0F0F0F).withOpacity(0.3))),
                  ),
                ),
              const Divider(
                endIndent: 8,
                indent: 8,
                height: 1,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: Text("Exercise duration",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF0F0F0F),
                        fontWeight: FontWeight.w400)),
                title: TextField(
                  controller: controller.timeEdit,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      hintText: "input",
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xFF0F0F0F).withOpacity(0.3))),
                ),
              ),
              const Divider(
                endIndent: 8,
                indent: 8,
                height: 1,
              ),
              if (controller.type == 1)
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 12, bottom: 8),
                  child: Text("Exercise log",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF0F0F0F),
                          fontWeight: FontWeight.w400)),
                ),
              if (controller.type == 1)
                TextField(
                  maxLines: 4,
                  controller: controller.logEdit,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      hintText: "input",
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xFF0F0F0F).withOpacity(0.3))),
                ),
              30.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    controller.addRecord();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color(0xFF4B8CF5),
                      // 设置边框颜色和宽度
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // 设置边框颜色和宽度
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
              22.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
