import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/pages/login_phone_page.dart';
import 'package:hi_app/pages/sign_up_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/widgets/hi_logo_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/background.png'),
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 56.0),
                physics: ClampingScrollPhysics(),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    HiLogoText(),
                    SizedBox(
                      height: 98.h,
                    ),
                    buttonChip(context: context, text: '로그인', onPressed: (){
                      Get.find<UserController>().signupInfoReset(isLoginPage: true);
                      Get.to(()=>LoginPhonePage());
                    }),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    buttonChip(context: context, text: '회원가입', onPressed: (){
                      Get.find<UserController>().signupInfoReset();
                      Get.to(()=>SignUpPage());
                    }),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget buttonChip({BuildContext context, String text, VoidCallback onPressed}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Color(0x66252525),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: onPressed,
          child: Center(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                text,
                style: TextStyle(fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


