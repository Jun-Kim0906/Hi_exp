import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/setting_controller.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key key}) : super(key: key);

  final SettingController _settingController = Get.put(SettingController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(
          children: [
            topSection(),
            SizedBox(
              height: 22.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 32.0.w,
                ),
                Text(
                  '알림설정',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff252525),
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                CupertinoSwitch(
                    activeColor: Theme.of(context).primaryColor,
                    value: _settingController.alarm,
                    onChanged: (bool alarm) {
                      _settingController.switchStatus(alarm);
                    }),
              ],
            ),
            SizedBox(
              height: 26.h,
            ),
            soundSection(context),
            SizedBox(
              height: 30.h,
            ),
            textSection(context),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 16.0.w),
            //   height: 107.h,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20.0),
            //       color: Color(0xffF5F6FA),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Color.fromRGBO(125, 125, 125, 0.17),
            //           blurRadius: 10.0,
            //           offset: Offset(0, 2),
            //         )
            //       ]),
            // ),
            SizedBox(
              height: 62.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.file_download_outlined,
                        color: Color(0xff808080),
                      ),
                      Text(
                        '  최신 상태입니다.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Color(0xff252525),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 103.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFFECECEC),
                    ),
                    child: Center(
                      child: Text(
                        '업데이트하기',
                        style: TextStyle(
                            color: Color(0xff7d7d7d),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 184.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 290.w),
              child: TextButton(
                onPressed: () async {
                  await _userController.signOut();
                  Get.until((route) => Get.currentRoute == '/');
                },
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Color(0xff7d7d7d)),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget topSection() {
    return SizedBox(
        height: 205.5.h,
        child: Stack(
          children: [
            Image.asset('assets/top2.png'),
            Positioned(
              left: 48.w,
              top: 103.0.h,
              child: Text(
                '설정',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: Colors.white),
              ),
            )
          ],
        ));
  }

  Widget soundSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0.w),
      height: 105.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xffF5F6FA),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(125, 125, 125, 0.17),
              blurRadius: 10.0,
              offset: Offset(0, 2),
            )
          ]),
      child: Stack(
        children: [
          Positioned(
            left: 20.0.w,
            top: 9.0.h,
            child: Text(
              '소리크기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0.sp,
                color: Color(0xff252525),
              ),
            ),
          ),
          Positioned(
            top: 20.0.h,
            right: 27.w,
            child: Image.asset(
              'assets/icons/speaker.png',
              width: 26.w,
              height: 26.w,
            ),
          ),
          Positioned(
              top: 46.0.h,
              left: 20.w,
              child: Icon(
                Icons.volume_mute,
                color: Colors.black,
              )),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: SfSliderTheme(
              data: SfSliderThemeData(
                  thumbColor: Colors.white,
                  thumbStrokeColor: Theme.of(context).primaryColor,
                  thumbStrokeWidth: 4.0,
                  inactiveTrackHeight: 6.0,
                  inactiveTrackColor: Color(0xffECECEC)),
              child: SfSlider(
                min: 0.0,
                max: 100.0,
                value: _settingController.vol,
                interval: 20,
                stepSize: 1,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  _settingController.adjustVol(value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget textSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0.w),
      height: 105.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xffF5F6FA),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(125, 125, 125, 0.17),
              blurRadius: 10.0,
              offset: Offset(0, 2),
            )
          ]),
      child: Stack(
        children: [
          Positioned(
            left: 20.0.w,
            top: 9.0.h,
            child: Text(
              '글자크기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0.sp,
                color: Color(0xff252525),
              ),
            ),
          ),
          Positioned(
              top: 20.0.h,
              right: 27.w,
              child: Text(
                '가',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff252525),
                ),
              )),
          Positioned(
              top: 46.0.h,
              left: 25.w,
              child: Text(
                '가',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff252525),
                ),
              )),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: SfSliderTheme(
              data: SfSliderThemeData(
                  thumbColor: Colors.white,
                  thumbStrokeColor: Theme.of(context).primaryColor,
                  thumbStrokeWidth: 4.0,
                  inactiveTrackHeight: 6.0,
                  inactiveTrackColor: Color(0xffECECEC)),
              child: SfSlider(
                min: 0.0,
                max: 100.0,
                value: _settingController.textSize,
                interval: 20,
                stepSize: 1.0,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  _settingController.adjustText(value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
