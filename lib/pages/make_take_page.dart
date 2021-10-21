import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/make_controller.dart';
import 'dart:math' as math;

final double mirror = math.pi;

class MakeTakePage extends StatelessWidget {
  MakeTakePage({Key key}) : super(key: key);

  final MakeController _makeController = Get.put(MakeController());
  final Size screenSize = Get.size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MakeController>(builder: (_) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            _makeController.cameras != null && _makeController.pageIndex != 3
                ? Center(
                    child: Transform.scale(
                      scale: screenSize.height / (screenSize.width / 9 * 16),
                      child: new AspectRatio(
                        aspectRatio:
                            1 / _makeController.controller.value.aspectRatio,
                        child: new CameraPreview(_makeController.controller),
                      ),
                    ),
                  )
                : Container(),
            _makeController.pageIndex == 3
                ? Center(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(mirror),
                      child: Transform.scale(
                        scale: screenSize.height / (screenSize.width / 9 * 16),
                        child: AspectRatio(
                          aspectRatio:
                              1 / _makeController.controller.value.aspectRatio,
                          child: Image.file(
                            File(_makeController.takeImagePath),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            _makeController.pageIndex == 1
                ? Positioned(
                    top: 101.h,
                    left: 20.h,
                    child: Text.rich(
                      TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                          children: [
                            TextSpan(
                              text: _makeController.guide1,
                            ),
                            TextSpan(
                              text: _makeController.infoExp,
                              style: TextStyle(
                                color: Color(0xffFF945D),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            TextSpan(
                              text: _makeController.guide2,
                            ),
                          ]),
                    ),
                  )
                : Container(),
            _makeController.pageIndex == 2
                ? Positioned(
                    top: 125.h,
                    left: 39.w,
                    child: Text(
                      _makeController.guide3,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  )
                : Container(),
            _makeController.pageIndex == 3
                ? Positioned(
                    top: 105.h,
                    left: 27.w,
                    child: Text(
                      _makeController.guide4,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  )
                : Container(),
            _makeController.pageIndex == 1
                ? Positioned(
                    top: 188.h,
                    left: 36.w,
                    right: 36.w,
                    child: SvgPicture.asset('assets/make/default_outline.svg'),
                  )
                : Container(),
            _makeController.pageIndex == 2
                ? Positioned(
                    top: 245.h,
                    left: 59.w,
                    right: 35.w,
                    child: SvgPicture.asset(
                        'assets/make/${_makeController.path}_outline.svg'))
                : Container(),
            _makeController.pageIndex != 3
                ? Positioned(
                    bottom: 21.h,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        await _makeController.toTookPage();
                      },
                      child: Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xffcfcfcf), width: 5)),
                        child: Center(
                          child: Container(
                            width: 62.w,
                            height: 62.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffff945d),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            _makeController.pageIndex != 3
                ? Positioned(
                    right: 19.w,
                    bottom: 101.h,
                    child: GestureDetector(
                      onTap: () {
                        _makeController.toHintPage();
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 57,
                            height: 57,
                            decoration: BoxDecoration(
                                color: Color(0xffff9065),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    blurRadius: 10,
                                    color: Color.fromRGBO(37, 37, 37, 0.25),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                'assets/read/hint.svg',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '힌트',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ))
                : Container(),
            _makeController.pageIndex == 3
                ? Positioned(
                    right: 43.w,
                    top: 176.h,
                    child: GestureDetector(
                      onTap: () async {
                        await _makeController.downloadPicture();
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 57,
                            height: 57,
                            decoration: BoxDecoration(
                                color: Color(0xffff9065),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    blurRadius: 10,
                                    color: Color.fromRGBO(37, 37, 37, 0.25),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset(
                                'assets/make/donwload.svg',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '저장하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ))
                : Container(),
            _makeController.pageIndex == 3
                ? Positioned(
                    right: 43.w,
                    top: 270.h,
                    child: GestureDetector(
                      onTap: () {
                        _makeController.retake();
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 57,
                            height: 57,
                            decoration: BoxDecoration(
                                color: Color(0xffff9065),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    blurRadius: 10,
                                    color: Color.fromRGBO(37, 37, 37, 0.25),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset(
                                'assets/make/reload.svg',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '다시찍기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ))
                : Container(),
            _makeController.pageIndex == 3
                ? Positioned(
                    right: 43.w,
                    top: 363.h,
                    child: GestureDetector(
                      onTap: () {
                        if(_makeController.success()){
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
                                              '모든 표정 문제를 잘 풀었어요!\n최종퀴즈로 넘어가볼까요?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xffff7645),
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.back();
                                                Get.back();
                                                Get.back();
                                              },
                                              child: Container(
                                                width: 163.w,
                                                height: 64.h,
                                                child: Center(
                                                  child: Text(
                                                    '아니오',
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
                                                  child: Text('예',
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

                        }else{
                          Get.dialog(BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                            child: Dialog(
                              child: Container(
                                width: 326.w,
                                height: 388.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 31.h,
                                        ),
                                        Image.asset(
                                          'assets/welcome_icon_high.png',
                                          width: 225.63.w,
                                        ),
                                        SizedBox(
                                          height: 23.h,
                                        ),
                                        Text(
                                          '성공했어요!',
                                          style: TextStyle(
                                              color: Color(0xffff7645),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp),
                                        ),
                                        SizedBox(
                                          height: 9.h,
                                        ),
                                        Text(
                                          '웃는 표정 짓기를 잘했어요\n다른 표정도 학습해볼까요?',
                                          style: TextStyle(
                                              color: Color(0xff7d7d7d),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        Get.back();
                                        Get.back();
                                      },
                                      child: Container(
                                        width: double.infinity,
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
                                                bottomLeft:
                                                Radius.circular(5.0))),
                                        child: Center(
                                          child: Text(
                                            '확인',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 57,
                            height: 57,
                            decoration: BoxDecoration(
                                color: Color(0xffff9065),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    blurRadius: 10,
                                    color: Color.fromRGBO(37, 37, 37, 0.25),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset(
                                'assets/make/next_arrow.svg',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '넘어가기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ))
                : Container(),
            _makeController.photoDownload
                ? Positioned(
                    bottom: 84.h,
                    left: 43.w,
                    right: 43.w,
                    child: Container(
                      height: 160.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(37, 37, 37, 0.6),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/make/donwload.svg',
                              width: 53.w,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              '저장이 완료되었습니다',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      );
    });
  }
}
