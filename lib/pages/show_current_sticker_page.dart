import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/pages/exp_make_page.dart';

class ShowCurrentStickerPage extends StatelessWidget {
  ShowCurrentStickerPage({Key key}) : super(key: key);

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      extendBodyBehindAppBar: true,
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            topSection(),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 59.0.w),
              child: Wrap(
                children: [
                  stickerWidget('카페\n표정읽기', true, date: '11.07'),
                  stickerWidget('카페\n표정읽기', true, date: '11.08'),
                  stickerWidget('카페\n표정읽기', true, date: '11.09'),
                  stickerWidget('카페\n표정읽기', true, date: '11.10'),
                  stickerWidget('카페\n표정읽기', false),
                  stickerWidget('카페\n표정읽기', false),
                  stickerWidget('카페\n표정읽기', false),
                  stickerWidget('카페\n표정읽기', false),
                  stickerWidget('카페\n표정읽기', false),
                  stickerWidget('카페\n표정읽기', false),
                  stickerWidget('카페\n표정읽기', false),
                  stickerWidget('카페\n표정읽기', false),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.dialog(
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Dialog(
                  backgroundColor: Colors.white,
                  child: SizedBox(
                    width: 326.w,
                    height: 369.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 31.h,),
                            Image.asset(
                              'assets/welcome_icon_high.png',
                              width: 225.63.w,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(height: 20.h,),
                            Text(
                              '성공했어요!',
                              style: TextStyle(
                                color: Color(0xffff7645),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 18.h,),
                            Text(
                              '자기표현 학습으로 넘어갈까요?',
                              style: TextStyle(
                                  color: Color(0xff7d7d7d),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.until((route) => Get.currentRoute == '/');
                              },
                              child: Container(
                                width: 163.w,
                                height: 64.h,
                                child: Center(
                                  child: Text(
                                    '메인으로',
                                    style: TextStyle(
                                        color: Color(0xffff945d),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.off(()=>ExpMakePage());
                              },
                              child: Container(
                                width: 163.w,
                                height: 64.h,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment(0, -0.2),
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Color(0xffFF9065),
                                      Color(0xffFF984E),
                                    ]),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.0),
                                  )
                                ),
                                child: Center(
                                  child: Text('넘어갈래요',
                                      style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              barrierDismissible: false);
        },
        child: Container(
          height: 78.h,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0, -0.2),
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xffFF9065),
                Color(0xffFF984E),
              ])),
          child: Center(
            child: Text(
              '스티커를 확인했어요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget topSection() {
    return Container(
      height: 350.h,
      child: Stack(
        children: [
          Image.asset('assets/top266.png'),
          Positioned(
            top: 98.h,
            left: 48.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_userController.user.name}님 최고에요! 참 잘했어요!\n자기표현 학습으로 넘어갈게요',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 208.h,
            left: 23.w,
            child: Container(
              width: 337.w,
              height: 140.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: 258.w,
                        height: 94.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                offset: Offset(0, 4),
                                color: Color.fromRGBO(125, 125, 125, 0.0791),
                              )
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(top: 23.h, left: 57.w),
                          child: Text(
                            '표정읽기 퀴즈로 스티커\n하나를 획득했어요!',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff252525),
                            ),
                          ),
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/thumb_up_charac.png',
                      width: 123.w,
                      fit: BoxFit.fitWidth,
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

  Widget stickerWidget(String title, bool checked, {String date}) {
    return Container(
      width: 98.w,
      height: 115.h,
      child: Column(
        children: [
          DottedBorder(
            dashPattern: [5, 5],
            color: Color(0xffB1B1B1),
            borderType: BorderType.RRect,
            strokeWidth: 1.7,
            radius: Radius.circular(100),
            child: Container(
              width: 76.w,
              height: 76.w,
              decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                shape: BoxShape.circle,
              ),
              child: checked
                  ? Image.asset('assets/sticker.png')
                  : Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffA1a1a1),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          date != null
              ? Text(
                  date,
                  style: TextStyle(
                      color: Color(0xffb1b1b1),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ],
      ),
    );
  }
}
