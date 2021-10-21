import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OkayButton extends StatelessWidget {
  const OkayButton({
    Key key, this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
        EdgeInsets.only(left: 39.0.w, right: 39.0.w, bottom: 64.0.h),
        child: Container(
          height: 74.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x2B6A6A6A),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(5.0),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color(0xffFF9F7A),
                    Color(0xffFFD360),
                  ])),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              onTap: onPressed,
              child: Center(
                  child: Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'NotoSansKR',
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
