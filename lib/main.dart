import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kooking/pages/Consumption/consumption_record_controller.dart';
import 'package:kooking/pages/Consumption/consumption_record_page.dart';
import 'package:kooking/pages/home/child/add_controller.dart';
import 'package:kooking/pages/home/child/add_record_page.dart';
import 'package:kooking/pages/home/home_controller.dart';
import 'package:kooking/pages/index_tab_page.dart';
import 'package:kooking/pages/pass/pass_set_binding.dart';
import 'package:kooking/pages/pass/pass_set_view.dart';
import 'package:kooking/pages/record/record_controller.dart';
import 'package:kooking/pages/setting/set_controller.dart';
import 'package:kooking/res/style.dart';
import 'db/db_service.dart';
import 'entity/resoin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DatabaseService().init());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // 设置状态栏文字和图标颜色为亮色（白色）
  ));
  //禁止横屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    ); //支持分屏
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Looks,
      builder: (context, child) {
        return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: Scaffold(
              // Global GestureDetector that will dismiss the keyboard
              resizeToAvoidBottomInset: false,
              body: KeyboardDismissOnTap(
                child: FlutterEasyLoading(
                  child: child,
                ),
              ),
            ));
      },
      theme: AppStyle.lightTheme,
      // themeMode: ThemeMode.light,
      //页面跳转风格
      defaultTransition: Transition.cupertino,
    );
  }
}
List<GetPage<dynamic>> Looks = [
  GetPage(
      name:'/',
      page: () => const PassSetView(),
      binding: PassSetBinding()
  ),
  GetPage(
      name:'/home',
      page: () => const IndexTabPage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<HomeController>(() => HomeController());
          Get.lazyPut<RecordController>(() => RecordController());
          Get.lazyPut<SetController>(() => SetController());
        },
      )),
  GetPage(
      name: '/resion',
      page: () => const ResoinPoi()
  ),
  GetPage(
      name: '/add',
      page: () => const AddRecordPage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<AddController>(() => AddController());
        },
      )),
  GetPage(
      name: '/crecord',
      page: () => const ConsumptionRecordPage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<ConsumptionRecordController>(() => ConsumptionRecordController());
        },
      ))
];