import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hi_app/pages/guardian_home_page.dart';
import 'package:hi_app/pages/guardian_pwd_set_page.dart';

class GuardianPwdCompletePage extends StatelessWidget {
  const GuardianPwdCompletePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/top3.png',
            fit: BoxFit.fitWidth,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140.h,
                ),
                Text(
                  '보호자 비밀번호 설정',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SvgPicture.asset(
                  'assets/vectors/complete.svg',
                  width: 75.w,
                  height: 75.w,
                ),
                SizedBox(
                  height: 28.h,
                ),
                Text(
                  '비밀번호 설정이 완료되었습니다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 252.h,
                ),
                buttonChip(context: context, text: '재설정하기', onPressed: (){
                  Get.off(()=>GuardianPWDSetPage());
                }),
                SizedBox(
                  height: 27.h,
                ),
                buttonChip(context: context, text: '확인', onPressed: (){
                  Get.off(()=>GuardianHomePage());

                }),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buttonChip({BuildContext context, String text, VoidCallback onPressed}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 58.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Color(0x66252525),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
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
                    fontSize: 17.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
