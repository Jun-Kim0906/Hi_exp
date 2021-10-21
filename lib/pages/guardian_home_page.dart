import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/models/user_model.dart';
import 'package:hi_app/pages/report_page.dart';
import 'package:hi_app/utils/expansion_card.dart';

class GuardianHomePage extends StatelessWidget {
  GuardianHomePage({Key key}) : super(key: key);

  final UserModel user = Get.find<UserController>().user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            onPressed: () {
              Get.until((route) => Get.currentRoute == '/');
            },
          ),
          title: Text(
            '보호자 페이지',
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff252525)),
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
                height: 214.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/top.png',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                )),
            SizedBox(
                height: 214.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/top_mask.png',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                )),
            Column(
              children: [
                Container(
                  height: 214.h,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 126.h, left: 32.w),
                        child: Text(
                          '안녕하세요, 보호자님',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                            color: Color(0xff252525),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 32.w),
                        child: Text(
                          '${user.name} 학습자의 학습결과를 확인해보세요',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff606060),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  // physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      ExpansionCard(
                        title: '카페 학습리포트',
                        period: '15일',
                        time: '3시간 13분',
                        children: [
                          customTile(
                              context: context,
                              title: '카페 학습리포트1',
                              period: '21.09.01 ~ 21.09.06',
                            onTap: (){
                                Get.to(()=>ReportPage());
                            }
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          customTile(
                              context: context,
                              title: '카페 학습리포트2',
                              period: '21.09.08 ~ 21.09.17'),
                        ],
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      ExpansionCard(
                        title: '마트 학습리포트',
                        period: '15일',
                        time: '3시간 13분',
                        children: [
                          customTile(
                              context: context,
                              title: '마트 학습리포트1',
                              period: '21.09.01 ~ 21.09.06'),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          customTile(
                              context: context,
                              title: '마트 학습리포트2',
                              period: '21.09.08 ~ 21.09.17'),
                        ],
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      ExpansionCard(
                        title: '편의점 학습리포트',
                        period: '15일',
                        time: '3시간 13분',
                        children: [
                          customTile(
                              context: context,
                              title: '편의점 학습리포트1',
                              period: '21.09.01 ~ 21.09.06'),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          customTile(
                              context: context,
                              title: '편의점 학습리포트2',
                              period: '21.09.08 ~ 21.09.17'),
                        ],
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      ExpansionCard(
                        title: '음식점 학습리포트',
                        period: '15일',
                        time: '3시간 13분',
                        children: [
                          customTile(
                              context: context,
                              title: '음식점 학습리포트1',
                              period: '21.09.01 ~ 21.09.06'),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          customTile(
                              context: context,
                              title: '음식점 학습리포트2',
                              period: '21.09.08 ~ 21.09.17'),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
  }

  Widget customTile(
      {BuildContext context, String title, String period, VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64.h,
        width: 300.w,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 0.5,
          color: Color(0xffD1D1D1),
        ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Color(0xff252525)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  period,
                  style: TextStyle(
                      color: Color(0xff7d7d7d),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0.h, right: 10.w),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
