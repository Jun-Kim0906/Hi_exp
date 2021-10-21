import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/controllers/read_controller.dart';
import 'package:hi_app/pages/show_current_sticker_page.dart';

class ReadQuizPage extends StatelessWidget {
  ReadQuizPage({Key key}) : super(key: key);

  final ReadController _readController = Get.put(ReadController());

  final screenSize = Get.mediaQuery.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
              print(_readController.readModels.length);
            },
          ),
          title: Text(
            '표정읽기',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 17.sp,
            ),
          ),
        ),
        body: GetBuilder<ReadController>(
          builder: (_) {
            return _readController.currentProblem != null
                ? Stack(
                    children: [
                      Image.network(_readController.currentProblem.photo),
                      Positioned(
                          top: 121.h,
                          left: 53.w,
                          child: Container(
                            width: 322.w,
                            height: 96,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/read/bubble.png',
                                  fit: BoxFit.fitWidth,
                                ),
                                Positioned(
                                    top: 14.h,
                                    left: 29.w,
                                    child: Container(
                                      width: 49.w,
                                      height: 49.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xffff9165),
                                              width: 2),
                                          image: DecorationImage(
                                            image: NetworkImage(_readController
                                                .currentProblem.photo),
                                            fit: BoxFit.cover,
                                            alignment: Alignment(0, -0.5),
                                          )),
                                    )),
                                Positioned(
                                    top: 14.h,
                                    left: 90.w,
                                    child: Container(
                                        width: 152.w,
                                        child: Text(
                                          _readController.currentProblem.line
                                              .replaceAll('\\n', '\n'),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.sp,
                                              color: Color(0xff252525)),
                                        ))),
                                Positioned(
                                  top: 26.h,
                                  right: 38.w,
                                  child: GestureDetector(
                                    onTap: () async {
                                      var player = await FlutterSoundPlayer().openAudioSession();
                                      player.startPlayer(
                                        fromURI: _readController.currentProblem.record,
                                      );
                                    },
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        child: Image.asset(
                                            'assets/icons/speaker.png')),
                                  ),
                                )
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 400.h,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                            color: Color(0xfffff3e1),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 400.h,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: Color(0xfffff3e1),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0x99FF8F67),
                                    Color(0x99FDD566),
                                  ])),
                          child: Padding(
                            padding: EdgeInsets.only(left: 58.w, right: 52.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 17.h, left: 5.w),
                                  child: Text(
                                    '표정읽기 퀴즈',
                                    style: TextStyle(
                                        color: Color(0xffff9065),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      (_readController.currentIndex + 1) < 10
                                          ? '0${(_readController.currentIndex + 1)}'
                                          : (_readController.currentIndex + 1)
                                              .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35.sp,
                                      ),
                                    ),
                                    Text(
                                      '/${_readController.readModels.length}',
                                      style: TextStyle(
                                        color: Color(0xff7d7d7d),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 7.w, right: 23.w),
                                  width: double.infinity,
                                  height: 5,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value:
                                          (_readController.currentIndex + 1) /
                                              _readController.readModels.length,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  _readController.currentProblem.situation
                                      .replaceAll('\\n', '\n'),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xff252525),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                option(_readController.currentProblem.choice[0],
                                    onPressed: () async {
                                  if (_readController.isCorrect(0)) {
                                    successDialog();
                                    _readController.nextProblem();
                                    await Future.delayed(Duration(seconds: 3));
                                    Get.back();
                                    if(_readController.isLastProblem()){
                                      Get.off(()=>ShowCurrentStickerPage());
                                    }
                                  } else {
                                    failDialog();
                                    await Future.delayed(Duration(seconds: 3));
                                    Get.back();
                                  }
                                }),
                                option(_readController.currentProblem.choice[1],
                                    onPressed: () async {
                                  if (_readController.isCorrect(1)) {
                                    successDialog();
                                    _readController.nextProblem();
                                    await Future.delayed(Duration(seconds: 3));
                                    Get.back();
                                    if(_readController.isLastProblem()){
                                      Get.off(()=>ShowCurrentStickerPage());
                                    }
                                  } else {
                                    failDialog();
                                    await Future.delayed(Duration(seconds: 3));
                                    Get.back();
                                  }
                                }),
                                option(_readController.currentProblem.choice[2],
                                    onPressed: () async {
                                  if (_readController.isCorrect(2)) {
                                    successDialog();
                                    _readController.nextProblem();
                                    await Future.delayed(Duration(seconds: 3));
                                    Get.back();
                                    if(_readController.isLastProblem()){
                                      Get.off(()=>ShowCurrentStickerPage());
                                    }
                                  } else {
                                    failDialog();
                                    await Future.delayed(Duration(seconds: 3));
                                    Get.back();
                                  }
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 394.h,
                        right: 22.w,
                        child: GestureDetector(
                          onTap: () {
                            Get.dialog(BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                              child: Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  width: 287.w,
                                  height: 298.h,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        left: 5.w,
                                        child: Container(
                                          width: 272.w,
                                          height: 212.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                              Text(
                                                '표정읽기 힌트가\n궁금한가요?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xffff9065),
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 17.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                height: 1,
                                                color: Color(0xffff7645),
                                              ),
                                              SizedBox(
                                                height: 14.h,
                                              ),
                                              Container(
                                                height: 86.h,
                                                width: 233.w,
                                                color: Color.fromRGBO(
                                                    255, 211, 96, 0.2),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 17.h),
                                                  child: Text(
                                                    _readController
                                                        .currentProblem.hint
                                                        .replaceAll(
                                                            '\\n', '\n'),
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff606060),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 5,
                                          bottom: 186.h,
                                          child: GestureDetector(
                                            onTap: (){
                                              Get.back();
                                            },
                                            child: Container(
                                              width: 35,
                                                height: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffff7645),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )),
                                      Positioned(
                                          child: Container(
                                              width: 176.w,
                                              child: Image.asset(
                                                'assets/read/hint_charc.png',
                                                fit: BoxFit.fitWidth,
                                              ))),
                                    ],
                                  ),
                                ),
                              ),
                            ));
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
                        ),
                      )
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }

  Widget option(String title, {VoidCallback onPressed}) {
    return Padding(
      padding: EdgeInsets.only(top: 9.0.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 53.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Color(0xffFF9166),
                  Color(0xffFF984E),
                ],
                begin: Alignment(0.366, 0),
                end: Alignment(0.523, 0),
              )),
          child: Padding(
            padding: EdgeInsets.only(left: 27.w, right: 23.w),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void successDialog() {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 309.h,
            width: 255.w,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: Color(0xffff9f7a),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment(0, -0.35),
                    child: SvgPicture.asset('assets/read/success.svg'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 128.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      '성공',
                      style: TextStyle(
                          color: Color(0xffff945d),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void failDialog() {
    Get.dialog(
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: 309.h,
              width: 255.w,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300.h,
                    decoration: BoxDecoration(
                      color: Color(0xffff9f7a),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Align(
                      alignment: Alignment(0, -0.35),
                      child: SvgPicture.asset('assets/read/fail.svg'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 128.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        '실패',
                        style: TextStyle(
                            color: Color(0xffff945d),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
