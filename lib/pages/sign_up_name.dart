import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/widgets/okay_button.dart';

class SignUpNamePage extends StatelessWidget {
  SignUpNamePage({Key key}) : super(key: key);

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
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
                    height: 190.0.h,
                  ),
                  textSection(),
                  SizedBox(
                    height: 70.h,
                  ),
                  inputName(),
                ],
              ),
            ),
          ),
        ),
        OkayButton(
          onPressed: () async {
            Get.dialog(
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    width: 323.w,
                    height: 395.41.h,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/welcome_icon.png'),
                          SizedBox(
                            height: 36.79.h,
                          ),
                          Text(
                            '${_userController.nameController.text}님, 반가워요!',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                              color: Color(0xff090A0A),
                            ),
                          ),
                          SizedBox(
                            height: 4.0.h,
                          ),
                          Text(
                            '표정하이에 가입을 축하해요',
                            style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7D7D7D),
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              barrierDismissible: false,
            );
            await _userController.signUp().then((value){
              Get.until((route) => Get.currentRoute == '/');
            });
          },
        ),
      ],
    );
  }

  Widget textSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 52.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '학습자의 이름은 뭔가요?',
            style: TextStyle(
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                color: Color(0xff252525),
                fontSize: 23.sp),
          ),
          SizedBox(
            height: 13.0.h,
          ),
          Text(
            '빈칸에 이름을 적어주세요',
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

  Widget inputName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.0.w),
      child: TextField(
        autocorrect: false,
        controller: _userController.nameController,
        keyboardType: TextInputType.name,
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
