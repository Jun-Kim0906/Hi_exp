import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickerPage extends StatelessWidget {
  const StickerPage({Key key}) : super(key: key);

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
      body: Column(
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
                  '나의 스티커',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  '20.11.02 ~ 11.05',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  '학습을 완료해서 스티커를 다 모아보세요',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
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
                            '조금만 더 힘내봐요\n금방 모을 수 있을거에요',
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
