import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/pages/practice_page.dart';

class PracticeCompletePage extends StatelessWidget {
  PracticeCompletePage({Key key}) : super(key: key);

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFBD80),
      body: Column(
        children: [
          SizedBox(
            height: 151.h,
          ),
          Text(
            '${_userController.user.name}님\n참!잘했어요!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 79.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 50.w),
              child: Image.asset(
                'assets/welcome_icon_high.png',
                width: double.infinity,
              )),
          SizedBox(
            height: 60.h,
          ),
          Text(
            '눈맞춤 연습 게임을 완료했습니다',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(
            height: 97.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.off(()=>PracticePage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    height: 64.h,
                    width: 163.w,
                    child: Center(
                      child: Text(
                        '다시하기',
                        style: TextStyle(
                          color: Color(0xffff945d),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFF9065),
                          Color(0xffFF984E),
                        ]
                      )
                    ),
                    height: 64.h,
                    width: 163.w,
                    child: Center(
                      child: Text(
                        '메인으로',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
