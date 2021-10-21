import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/controllers/make_controller.dart';

class MakeInfoPage extends StatelessWidget {
  MakeInfoPage({Key key}) : super(key: key);

  final MakeController _makeController = Get.put(MakeController());

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
            // Get.until((route) => Get.currentRoute == '/');
          },
        ),
        title: Text(
          '상상하기',
          style: TextStyle(
            color: Color(0xff252525),
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/make/${_makeController.path}_back.png',
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 169.h,
            left: 32.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _makeController.infoComment,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp),
                ),
                SizedBox(height: 15.h,),
                Text(
                  _makeController.subInfoComment,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp),
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 44.h,
            right: 23.w,
            left: 23.w,
            child: GestureDetector(
              onTap: (){
                _makeController.toTakePage();
              },
              child: Container(
                  height: 71.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment(0, -0.3),
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFF9065),
                      Color(0xffFF984E),
                    ]
                  )
                ),
                child: Center(
                  child: Text(
                    '${_makeController.infoExp}을 지 준비가 되었어요',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
