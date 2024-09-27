import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kooking/pages/home/home_controller.dart';

import '../../../db/db_service.dart';
import '../../record/record_controller.dart';

class AddController extends GetxController {
  int type = 0;
  String projectName = "";
  final db = Get.find<DatabaseService>();
  String lastRecordedTime = '';
  String title = '';
  TextEditingController hourPriceEdit = TextEditingController();
  TextEditingController timeEdit = TextEditingController();
  TextEditingController logEdit = TextEditingController();
  final DateFormat formatterDay = DateFormat('MM/dd/yyyy');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    type = Get.arguments["type"];
    title = Get.arguments["title"];
    projectName = Get.arguments["projectName"];
  }

  addRecord() {
    EasyLoading.show();
    if (type == 1) {
      if (timeEdit.text.isEmpty || logEdit.text.isEmpty) {
        return;
      }
      db.addRecord(projectName, null, double.parse(timeEdit.text), logEdit.text,
          formatterDay.format(DateTime.now()));
    } else {
      if (timeEdit.text.isEmpty || hourPriceEdit.text.isEmpty) {
        return;
      }
      double totalPrice = double.parse(timeEdit.text) * double.parse(hourPriceEdit.text);
      db.addRecord(projectName, totalPrice, double.parse(timeEdit.text), null,
          formatterDay.format(DateTime.now()));
    }
    HomeController.to.intDate();
    Future.delayed(const Duration(seconds: 1)).then((v) {
      EasyLoading.dismiss();
      Get.back();
    });
    RecordController.to.initData();
  }
}
