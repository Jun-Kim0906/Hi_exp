import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/controllers/practice_controller.dart';
import 'package:hi_app/pages/practice_complete_page.dart';
import 'package:hi_app/widgets/practice_expansion.dart';

class PracticePage extends StatelessWidget {
  PracticePage({Key key}) : super(key: key);

  final Size screenSize = Get.mediaQuery.size;

  final PracticeController _practiceController =
      Get.put<PracticeController>(PracticeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PracticeController>(builder: (_) {
      return Scaffold(
        body: Stack(
          children: [
            Scaffold(
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
              body: Stack(
                children: [
                  Image.asset('assets/top_practice.png'),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/practice/person_background.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 132.h,
                    child: SizedBox(
                      width: screenSize.width,
                      child: Container(
                        margin: EdgeInsets.only(left: 36.76.w, right: 20.36),
                        width: double.infinity,
                        height: 153.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 311.w,
                                height: 123.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 20.h,
                                      left: 24.w,
                                      child: Text(
                                        '눈맞춤 연습 게임',
                                        style: TextStyle(
                                            color: Color(0xff252525),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.sp),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 20.h,
                                        left: 24.w,
                                        child: Text(
                                          _practiceController.pageIndex < 5
                                              ? '원하는 사물 한가지를 선택하면\n게임이 시작됩니다'
                                              : '선택한 사물을 따라 시선을\n움직여보세요',
                                          style: TextStyle(
                                              color: Color(0xff7d7d7d),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 119.88.w,
                                height: 113.h,
                                child: Image.asset(
                                  'assets/point_character.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: _practiceController.pageIndex == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      verticalDirection: VerticalDirection.up,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            _practiceController.selectObject(1);
                            await _practiceController.nextPage();
                            Get.off(() => PracticeCompletePage());
                          },
                          child: Container(
                              width: 58.w,
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: _practiceController.object == 1
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                              child: SvgPicture.asset(
                                'assets/practice/car.svg',
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            _practiceController.selectObject(2);
                            await _practiceController.nextPage();
                            Get.off(() => PracticeCompletePage());
                          },
                          child: Container(
                              width: 58.w,
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: _practiceController.object == 2
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                              child: SvgPicture.asset(
                                'assets/practice/note.svg',
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            _practiceController.selectObject(3);
                            await _practiceController.nextPage();
                            Get.off(() => PracticeCompletePage());
                          },
                          child: Container(
                              width: 58.w,
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: _practiceController.object == 3
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                              child: SvgPicture.asset(
                                'assets/practice/rocket.svg',
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                        PracticeExpansion(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                _practiceController.selectObject(4);
                                await _practiceController.nextPage();
                                Get.off(() => PracticeCompletePage());
                              },
                              child: Container(
                                  width: 58.w,
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: _practiceController.object == 4
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/practice/robot.svg',
                                    fit: BoxFit.fitWidth,
                                  )),
                            ),
                            GestureDetector(
                              onTap: () async {
                                _practiceController.selectObject(5);
                                await _practiceController.nextPage();
                                Get.off(() => PracticeCompletePage());
                              },
                              child: Container(
                                  width: 58.w,
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: _practiceController.object == 5
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/practice/wood.svg',
                                    fit: BoxFit.fitWidth,
                                  )),
                            ),
                          ],
                        )
                      ],
                    )
                  : null,
            ),
            Visibility(
              visible: (_practiceController.pageIndex >= 2 &&
                      _practiceController.pageIndex <= 5)
                  ? true
                  : false,
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    color: Color(0x88ffffff),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _practiceController.pageIndex == 2,
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/practice/focus.svg',
                      height: 35.h,
                      width: 35.w,
                    ),
                  ),
                  Positioned(
                    bottom: 173.h,
                    right: 36.w,
                    left: 36.w,
                    child: Container(
                      width: 357.w,
                      height: 71.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(37, 37, 37, 0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '눈맞춤 게임을 시작하기 전에\n가운데에 있는 원을 바라보세요',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: _practiceController.pageIndex == 3,
              child: Stack(
                children: [
                  Positioned(
                    top: 436.h,
                    left: 122.w,
                    child: Container(
                      width: 57.w,
                      height: 57.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromRGBO(255, 14, 14, 0.4),
                            width: 2.0,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 173.h,
                    right: 36.w,
                    left: 36.w,
                    child: Container(
                      width: 357.w,
                      height: 71.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(37, 37, 37, 0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '빨간색은 당신의 시선입니다',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _practiceController.pageIndex == 4,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 173.h,
                    right: 36.w,
                    left: 36.w,
                    child: Container(
                      width: 357.w,
                      height: 71.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(37, 37, 37, 0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '빨간색 원과 사물의 위치가 최대한\n비슷할 수 있도록 시선을 움직여 보세요',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 531.h,
                    left: 68.w,
                    child: SvgPicture.asset(
                      'assets/practice/${_practiceController.objectPath}.svg',
                      width: 36.w,
                    ),
                  ),
                  Positioned(
                    top: 483.h,
                    left: 114.w,
                    child: SvgPicture.asset(
                      'assets/practice/${_practiceController.objectPath}.svg',
                      width: 36.w,
                    ),
                  ),
                  Positioned(
                    top: 432.h,
                    left: 133.w,
                    child: SvgPicture.asset(
                      'assets/practice/${_practiceController.objectPath}.svg',
                      width: 36.w,
                    ),
                  ),
                  Positioned(
                    top: 416.h,
                    left: 213.w,
                    child: SvgPicture.asset(
                      'assets/practice/${_practiceController.objectPath}.svg',
                      width: 36.w,
                    ),
                  ),
                  Positioned(
                    top: 459.h,
                    left: 248.w,
                    child: SvgPicture.asset(
                      'assets/practice/${_practiceController.objectPath}.svg',
                      width: 36.w,
                    ),
                  ),
                  AnimatedPositioned(
                      top: _practiceController.aniStart ? 432.h : 483.h,
                      left: _practiceController.aniStart ? 133.w : 114.w,
                      child: Container(
                        width: 57.w,
                        height: 57.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color.fromRGBO(255, 14, 14, 0.4),
                              width: 2.0,
                            )),
                      ),
                      duration: Duration(seconds: 2))
                ],
              ),
            ),
            Visibility(
              visible: _practiceController.pageIndex == 5,
              child: Stack(
                children: [
                  Positioned(
                    top: 423.h,
                    right: 36.w,
                    left: 36.w,
                    child: Container(
                      width: 357.w,
                      height: 71.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(37, 37, 37, 0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '자, 이제 게임을 시작할께요!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _practiceController.pageIndex == 6,
              child: Stack(
                children: [
                  Image.asset(
                      'assets/practice/${_practiceController.objectPath}.gif'),
                  Image.asset('assets/practice/sight.gif',
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
