import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HiLogoText extends StatelessWidget {
  const HiLogoText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            fontWeight: FontWeight.w700,
            color: Theme.of(context).primaryColor,
            fontSize: 20.sp,
          ),
        )
      ],
    );
  }
}