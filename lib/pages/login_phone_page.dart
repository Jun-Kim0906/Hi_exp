import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/widgets/okay_button.dart';

class LoginPhonePage extends StatelessWidget {
  LoginPhonePage({Key key}) : super(key: key);

  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        builder: (_){
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 190.h,
                        ),
                        textSection(),
                        SizedBox(
                          height: 86.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 29.0.w),
                          child: TextField(
                            controller: _.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            strutStyle: StrutStyle(
                              fontFamily: 'NotoSansKR',
                            ),
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                  color: Color(0xffDFDFDF),
                                )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0.h,
                        ),
                        Visibility(
                          visible: !_.isExist,
                          child: Padding(
                            padding: EdgeInsets.only(left: 44.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 17.0,
                                ),
                                Text(
                                  '  ????????? ????????? ???????????? ???????????? ?????? ??? ????????????. ??????\n'
                                      '  ??? ???????????? ?????? ???????????????.',
                                  style: TextStyle(
                                    color: Color(0xffD61D1D),
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.0.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              OkayButton(
                onPressed: () async {
                  print(_.isExist);
                  await _.isPhoneNumExist();
                  print(_.isExist);
                  if(_.isExist){
                    await _userController.signIn(_.phoneNumberController.text).then((value){
                      Get.until((route) => Get.currentRoute == '/');
                    });
                  }
                },
              ),
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
             '????????? ????????? ????????? ????????? ??????????',
              style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff252525),
                  fontSize: 20.sp),
            ),
          ),
          SizedBox(
            height: 3.0.h,
          ),
          Text(
            '????????? ????????? ??????????????????',
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
}
