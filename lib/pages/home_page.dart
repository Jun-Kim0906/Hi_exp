import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/pages/guardian_login_page.dart';
import 'package:hi_app/pages/guardian_pwd_set_page.dart';
import 'package:hi_app/pages/practice_page.dart';
import 'package:hi_app/pages/select_job_page.dart';
import 'package:hi_app/pages/setting_page.dart';
import 'package:hi_app/pages/sticker_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          topSection(context),
          SizedBox(
            height: 33.h,
          ),
          midSection(context),
          SizedBox(
            height: 26.17.h,
          ),
          bottomSection(),
        ],
      ),
    );
  }

  Widget topSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 395.h,
      child: Stack(
        children: [
          Image.asset('assets/top.png'),
          Image.asset('assets/top_mask.png'),
          Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top, right: 15.w),
                    child: IconButton(
                        onPressed: () {
                          Get.to(() => SettingPage());
                        },
                        icon: SvgPicture.asset(
                          'assets/vectors/setting.svg',
                          width: 22,
                        ))),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFF7645),
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                ),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 10.0.h,
                    left: 30.0.w),
                width: 103.w,
                height: 38.0.h,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(19.0),
                    onTap: () {
                      if (_userController.user.pwdExist) {
                        Get.to(() => GuardianLoginPage());
                      } else {
                        Get.to(() => GuardianPWDSetPage());
                      }
                    },
                    child: Center(
                      child: Text(
                        '보호자 페이지',
                        maxLines: 1,
                        style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 29.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '안녕하세요, ${_userController.user.name}님',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.sp,
                          color: Colors.white,
                          fontFamily: 'NotoSansKR'),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Text(
                      '오늘도 즐겁게 학습해볼까요?',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontFamily: 'NotoSansKR'),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 41.0.w,
            child: Container(
              width: 356.88.w,
              height: 153.h,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 311.w,
                        height: 123.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x147D7D7D),
                                blurRadius: 30,
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        padding: EdgeInsets.only(left: 18.w, top: 18.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '이전에 학습했던 부분부터 이어서\n학습하시겠어요?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Color(0xff606060),
                                  fontFamily: 'NotoSansKR'),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 133.w),
                              child: // Figma Flutter Generator Group78019117Widget - GROUP
                                  Container(
                                      width: 86.w,
                                      height: 20.h,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                          top: 7.0.h,
                                          left: 0,
                                          child: SvgPicture.asset(
                                              'assets/vectors/Vector294.svg',
                                              width: 86.w,
                                              height: 12.5.h,
                                              semanticsLabel: 'vector294'),
                                        ),
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Text(
                                              '이동하기',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 117, 69, 1),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.875),
                                            )),
                                      ])),
                            )
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/point_character.png',
                      width: 119.88.w,
                      height: 113.0.h,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget midSection(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                barrierDismissible: false,
                barrierColor: Color.fromRGBO(37, 37, 37, 0.7),
                context: context,
                builder: (context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Dialog(
                        backgroundColor: Colors.white,
                        child: Container(
                          width: 326.w,
                          height: 369.h,
                          child: Column(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 55.0.h,
                                  ),
                                  Container(
                                    width: 99.24.w,
                                    height: 121.46.h,
                                    child: Image.asset(
                                      'assets/smile_charac.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.79.h,
                                  ),
                                  Text(
                                    '표정읽기',
                                    style: TextStyle(
                                        fontSize: 20.0.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFF7645),
                                        fontFamily: 'NotoSansKR'),
                                  ),
                                  SizedBox(
                                    height: 9.0.h,
                                  ),
                                  Text(
                                    '표정을 읽고 상황에 알맞는\n답을 선택해주세요',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff7d7d7d),
                                        fontFamily: 'NotoSansKR'),
                                  ),
                                ],
                              )),
                              GestureDetector(
                                onTap: () {
                                  Get.off(() => SelectJobPage());
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  height: 64.0.h,
                                  color: Color(0xffFF9065),
                                  child: Center(
                                      child: Text(
                                    '확인',
                                    style: TextStyle(
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffffffff),
                                        fontFamily: 'NotoSansKR'),
                                  )),
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 29.w),
            height: 103.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(125, 125, 125, 0.25),
                    offset: Offset(0, 2),
                    blurRadius: 17)
              ],
              gradient: LinearGradient(
                  begin: Alignment(-1.932, -2),
                  end: Alignment(0.517, 0.827),
                  colors: [
                    Color.fromRGBO(255, 211, 96, 1),
                    Color.fromRGBO(255, 159, 122, 1),
                  ]),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20.0.w, top: 19.0.h, bottom: 23.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '학습하기 ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '다양한 상황속에서 표정과 말을 학습해봐요',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.36.w),
            child: Image.asset(
              'assets/home_bubble.png',
              width: 118.64.w,
              height: 105.83.h,
            ),
          ),
        )
      ],
    );
  }

  Widget bottomSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => StickerPage());
            },
            child: SizedBox(
              width: 153.41.w,
              height: 215.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 145.w,
                      height: 198.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              offset: Offset(0, 2),
                              color: Color.fromRGBO(125, 125, 125, 0.25),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0.w, right: 13.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '나의\n스티커',
                                  style: TextStyle(
                                    color: Color(0xff606060),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    height: 1.3333,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xffFFD360),
                                  // size: 16.0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.0.h,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 16.0.w, right: 9.0.w),
                            child: Text(
                              '학습을 통해 모은 스티커를 확인하세요',
                              style: TextStyle(
                                  color: Color(0xff7d7d7d),
                                  fontSize: 14.sp,
                                  height: 1.2857,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 11.0.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 101.79.w,
                      height: 100.58.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFFFD360),
                      ),
                      child: Center(
                        child: Container(
                          width: 52.15.w,
                          height: 52.15.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/vectors/check.svg',
                              height: 17.73.h,
                              width: 24.29.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => PracticePage());
            },
            child: SizedBox(
              width: 153.41.w,
              height: 215.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 145.w,
                      height: 198.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              offset: Offset(0, 2),
                              color: Color.fromRGBO(125, 125, 125, 0.25),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0.w, right: 13.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '눈맞춤\n연습게임',
                                  style: TextStyle(
                                    color: Color(0xff606060),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    height: 1.3333,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xffFF9F7A),
                                  // size: 16.0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.0.h,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 17.0.w, right: 8.0.w),
                            child: Text(
                              '게임을 통해 눈맞춤을 학습해보세요',
                              style: TextStyle(
                                  color: Color(0xff7d7d7d),
                                  fontSize: 14.sp,
                                  height: 1.2857,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 11.0.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 101.79.w,
                      height: 100.58.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFFF9F7A),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/vectors/eye.svg',
                          height: 48.44.h,
                          width: 60.55.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
