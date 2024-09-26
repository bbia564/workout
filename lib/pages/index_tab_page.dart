import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kooking/pages/home/home_page.dart';
import 'package:kooking/pages/record/record_page.dart';
import 'package:kooking/pages/setting/set_page.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class IndexTabPage extends StatefulWidget {
  const IndexTabPage({super.key});

  @override
  State<IndexTabPage> createState() => _HomePageState();
}

class _HomePageState extends State<IndexTabPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: currentIndex,
        children: const [HomePage(), RecordPage(), SettingPage()],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_plan.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/ic_plan_s.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_recod.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/ic_recod_s.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          label: 'Record',
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_setting.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/ic_setting_s.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          label: 'Setting',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        Get.focusScope?.unfocus();
        setState(() {
          currentIndex = index;
          if (currentIndex == 0) {}
        });
      },
    );
  }
}
