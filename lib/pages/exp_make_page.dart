import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/make_controller.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/pages/make_info_page.dart';

class ExpMakePage extends StatelessWidget {
  ExpMakePage({Key key}) : super(key: key);

  final MakeController _makeController = Get.put(MakeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MakeController>(builder: (_) {
      return Scaffold(
        backgroundColor: Color(0xfffff6e8),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Stack(
            children: [
              Image.asset('assets/top_make.png', fit: BoxFit.fitWidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 174.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33.w),
                    child: Text(
                      '${Get
                          .find<UserController>()
                          .user
                          .name}님 연습하고 싶은\n표정을 골라보세요!',
                      style: TextStyle(
                          color: Color(0xff252525),
                          fontSize: 27.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.w),
                    child: Text(
                      '선택 가능한 표정은 다음과 같습니다',
                      style: TextStyle(
                          color: Color(0xff7d7d7d),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  tap(
                      title: '웃는 표정',
                      subtitle: '웃는 표정을 연습해볼까요?',
                      image: Image.asset('assets/make/smile.png'),
                      isComplete: _makeController.smileComplete,
                      onPressed: () {
                        _makeController.categorySelect(1);
                      }),
                  tap(
                      title: '화난 표정',
                      subtitle: '화난 표정을 연습해볼까요?',
                      image: Image.asset('assets/make/angry.png'),
                      isComplete: _makeController.angryComplete,
                      onPressed: () {
                        _makeController.categorySelect(2);
                      }),
                  tap(
                      title: '슬픈 표정',
                      subtitle: '슬픈 표정을 연습해볼까요?',
                      image: Image.asset('assets/make/sad.png'),
                      isComplete: _makeController.sadComplete,
                      onPressed: () {
                        _makeController.categorySelect(3);
                      }),
                  tap(
                      title: '졸린 표정',
                      subtitle: '졸린 표정을 연습해볼까요?',
                      image: Image.asset('assets/make/tired.png'),
                      isComplete: _makeController.tiredComplete,
                      onPressed: () {
                        _makeController.categorySelect(4);
                      }),
                  tap(
                    title: '놀란 표정',
                    subtitle: '놀란 표정을 연습해볼까요?',
                    image: Image.asset('assets/make/surprised.png'),
                    onPressed: () {
                      _makeController.categorySelect(5);
                    },
                    isComplete: _makeController.surpriseComplete,
                  ),
                  _makeController.surpriseComplete &&
                      _makeController.tiredComplete &&
                      _makeController.sadComplete &&
                      _makeController.angryComplete &&
                      _makeController.smileComplete ? tap(
                    title: '최종퀴즈',
                    subtitle: '최종퀴즈로 넘어가 연습해볼까요?',
                    onPressed: (){

                    },
                    image: Image.asset('assets/make/final.png',),
                    isComplete: false,
                  ):Container(),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget tap({VoidCallback onPressed,
    String title,
    String subtitle,
    Widget image,
    bool isComplete}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 121.h,
        margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 29.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ],
            color: isComplete ? Color(0xffECEAEA) : Colors.white),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              left: 10.w,
              height: 100.h,
              width: 100.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffffefc2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: image,
                ),
              ),
            ),
            Positioned(
              top: 35.h,
              left: 141.w,
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xffff984e),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 73.h,
              left: 142.w,
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Color(0xff7d7d7d),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 47.h,
              right: 23.w,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffff984e),
              ),
            )
          ],
        ),
      ),
    );
  }
}
