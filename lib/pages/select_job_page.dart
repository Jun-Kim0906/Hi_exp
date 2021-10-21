import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/controllers/read_controller.dart';
import 'package:hi_app/pages/read_quiz_page.dart';

class SelectJobPage extends StatelessWidget {
  SelectJobPage({Key key}) : super(key: key);

  final ReadController _readController = Get.put(ReadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffFFF3E1),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            topSec(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Text(
                    '직업종류',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xff606060),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  cafeSec(onPressed: () {
                    _readController.getProblems(1);
                    Get.to(()=>ReadQuizPage());
                  }),
                  SizedBox(
                    height: 28.h,
                  ),
                  convSec(onPressed: () {
                    _readController.getProblems(2);
                    Get.to(()=>ReadQuizPage());
                  }),
                  SizedBox(
                    height: 28.h,
                  ),
                  martSec(onPressed: () {
                    _readController.getProblems(3);
                    Get.to(()=>ReadQuizPage());
                  }),
                  SizedBox(
                    height: 28.h,
                  ),
                  restSec(onPressed: () {
                    _readController.getProblems(4);
                    Get.to(()=>ReadQuizPage());
                  }),
                  SizedBox(
                    height: 28.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topSec() {
    return Container(
      height: 266.5.h,
      child: Stack(
        children: [
          Image.asset('assets/top266.png'),
          Positioned(
            top: 117.h,
            left: 30.w,
            child: Container(
              width: 337.w,
              height: 132.7.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 258.w,
                      height: 101.31.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 18.h,
                              left: 28.w,
                              child: Text(
                                '학습할 직업을 선택해주세요!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Color(0xff252525)),
                              )),
                          Positioned(
                              top: 50.h,
                              left: 56.w,
                              child: Text(
                                '원하는 직업을 한개씩 골라주세요!\n거기에 맞는 시나리오가 나옵니다.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Color(0xff252525)),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/thumb_up_charac.png',
                      width: 123.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Get.until((route) => Get.currentRoute == '/');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget cafeSec({VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 156.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Color.fromRGBO(0, 0, 0, 0.25),
              )
            ],
            gradient: LinearGradient(colors: [
              Color.fromRGBO(255, 198, 103, 1),
              Color.fromRGBO(255, 172, 125, 1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Positioned(
              top: 21.h,
              left: 29.w,
              child: Text(
                '카페',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 61.h,
              left: 29.w,
              child: Text(
                '카페에서 일어나는 상황을\n학습해보세요',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 110.h,
              left: 29.w,
              child: Container(
                width: 86.w,
                height: 28.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '학습하기',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/read/arrow.svg',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              right: 30.w,
              child: Container(
                width: 90.w,
                height: 90.w,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/read/cafe.png',
                      width: 63.42.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget martSec({VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 156.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Color.fromRGBO(0, 0, 0, 0.25),
              )
            ],
            gradient: LinearGradient(colors: [
              Color(0xffFF984E),
              Color(0xffFFBA9F),
            ], begin: Alignment.center, end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Positioned(
              top: 21.h,
              left: 29.w,
              child: Text(
                '마트',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 61.h,
              left: 29.w,
              child: Text(
                '마트에서 일어나는 상황을\n학습해보세요',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 110.h,
              left: 29.w,
              child: Container(
                width: 86.w,
                height: 28.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '학습하기',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/read/arrow.svg',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              right: 30.w,
              child: Container(
                width: 90.w,
                height: 90.w,
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      child: Image.asset(
                        'assets/read/mart.png',
                        width: 75.42.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget convSec({VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 156.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Color.fromRGBO(0, 0, 0, 0.25),
              )
            ],
            gradient: LinearGradient(colors: [
              Color(0xffFFBA9F),
              Color(0xffFF984E),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Positioned(
              top: 21.h,
              left: 29.w,
              child: Text(
                '편의점',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 61.h,
              left: 29.w,
              child: Text(
                '편의점에서 일어나는 상황을\n학습해보세요',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 110.h,
              left: 29.w,
              child: Container(
                width: 86.w,
                height: 28.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '학습하기',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/read/arrow.svg',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              right: 30.w,
              child: Container(
                width: 90.w,
                height: 90.w,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/read/convenience.png',
                      width: 63.42.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget restSec({VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 156.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Color.fromRGBO(0, 0, 0, 0.25),
              )
            ],
            gradient: LinearGradient(colors: [
              Color(0xffFF984E),
              Color(0xffFFBA9F),
            ], begin: Alignment.center, end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Positioned(
              top: 21.h,
              left: 29.w,
              child: Text(
                '음식점',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 61.h,
              left: 29.w,
              child: Text(
                '음식점에서 일어나는 상황을\n학습해보세요',
                style: TextStyle(
                  color: Color(0xfff5f6fa),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 110.h,
              left: 29.w,
              child: Container(
                width: 86.w,
                height: 28.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '학습하기',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/read/arrow.svg',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              right: 30.w,
              child: Container(
                width: 90.w,
                height: 90.w,
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 8.h,
                      left: 50.w,
                      child: Image.asset(
                        'assets/read/spoon.png',
                        height: 76.42.w,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
