import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF5F6FA),
      body: Stack(
        children: [
          Image.asset('assets/background.png'),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 104.w,
                      child: Image.asset(
                        'assets/logo/Hi_logo.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(
                      height: 15.64.h,
                    ),
                    Text(
                      '표정하이',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
