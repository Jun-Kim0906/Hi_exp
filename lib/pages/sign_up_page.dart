import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/pages/sign_up_phone.dart';
import 'package:hi_app/widgets/okay_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key key}) : super(key: key);

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (_) {
      return Stack(
        children: [
          Image.asset('assets/background.png'),
          GestureDetector(
            onTap: ()=>FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 190.h,
                    ),
                    textSection(),
                    SizedBox(
                      height: 19.h,
                    ),
                    selectParent(),
                    // SizedBox(
                    //   height: 58,
                    // ),
                    // inputPhoneNumber(),
                  ],
                ),
              ),
              // bottomNavigationBar: Padding(
              //   padding: EdgeInsets.only(left: 39.0.w, right: 39.0.w, bottom: 64.0.h),
              //   child: Container(
              //     child: Material(
              //       color: Colors.transparent,
              //       child: Center(
              //         child: Text(
              //           '확인',
              //           style: TextStyle(
              //             fontSize: 20.sp,
              //             fontWeight: FontWeight.w700,
              //             color: Colors.white,
              //             fontFamily: 'NotoSansKR',
              //           ),
              //         )
              //       ),
              //     ),
              //   ),
              // ),
            ),
          ),
          Visibility(
            visible: _.momOrDad != 0,
            child: OkayButton(
              onPressed: () {
                Get.to(()=>SignUpPhone());
              },
            ),
          )
        ],
      );
    });
  }

  Widget textSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 41.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              '엄마나 아빠의 핸드폰 번호가\n뭔가요?',
              style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff252525),
                  fontSize: 23.sp),
            ),
          ),
          SizedBox(
            height: 5.0.h,
          ),
          Text(
            '엄마나 아빠 중 한명을 선택해주세요',
            style: TextStyle(
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w400,
                color: Color(0xff7D7D7D),
                fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget selectParent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 108.w,
          height: 156.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: _userController.momOrDad == 1
                ? Color(0xffFF7645)
                : Color(0xffFF9F7A),
            boxShadow: [
              BoxShadow(
                color: Color(0x66000000),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: () {
                _userController.selectMomOrDad(1);
              },
              child: Padding(
                  padding:
                      EdgeInsets.only(top: 24.0.h, left: 24.h, right: 24.h),
                  child: Column(
                    children: [
                      Container(
                        width: 60.w,
                        child: Image.asset(
                          'assets/person_shape.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Text(
                        '엄마',
                        style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff606060)),
                      )
                    ],
                  )),
            ),
          ),
        ),
        SizedBox(
          width: 25.3,
        ),
        Container(
          width: 108.w,
          height: 156.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color:  _userController.momOrDad == 2
                ? Color(0xffFF7645)
                : Color(0xffFFd360),
            boxShadow: [
              BoxShadow(
                color: Color(0x66000000),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: () {
                _userController.selectMomOrDad(2);
              },
              child: Padding(
                  padding:
                      EdgeInsets.only(top: 24.0.h, left: 24.h, right: 24.h),
                  child: Column(
                    children: [
                      Container(
                        width: 60.w,
                        child: Image.asset(
                          'assets/person_shape.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Text(
                        '아빠',
                        style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff606060)),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputPhoneNumber() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.27),
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Color(0xffDFDFDF))),
        ),
      ),
    );
  }
}
