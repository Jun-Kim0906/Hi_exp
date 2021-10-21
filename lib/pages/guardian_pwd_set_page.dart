import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/guard_controller.dart';
import 'package:hi_app/pages/guardian_pwd_complete_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GuardianPWDSetPage extends StatelessWidget {
  GuardianPWDSetPage({Key key}) : super(key: key);

  final GuardController _guardController = Get.put(GuardController());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
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
                    height: 111.h,
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
                    height: 42.h,
                  ),
                  SvgPicture.asset(
                    'assets/vectors/lock.svg',
                    width: 73.w,
                    height: 73.w,
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  GetBuilder<GuardController>(
                    builder: (_){
                      return Column(
                        children: [
                          Text(
                            !_guardController.confirmPage?'비밀번호를 설정해주세요':'비밀번호를 한 번 더 입력해주세요',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                color: _guardController.isValid ?Colors.transparent: Colors.red,
                                size: 17.0,
                              ),
                              Text(
                                ' 처음 쓴 비밀번호와 다릅니다. 확인 후 다시 입력해주세요',
                                style: TextStyle(
                                  color: _guardController.isValid ?Colors.transparent: Colors.red,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0.sp,
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 26.0.h,),
                  Container(
                    width: 159.w,
                    child: PinCodeTextField(
                      appContext: context,
                      controller: _guardController.passwordController,
                      focusNode: _focusNode,
                      length: 4,
                      onChanged: (v){},
                      onCompleted: (value) {
                        if(!_guardController.confirmPage){
                          _guardController.goToConfirmPage(value);
                          _focusNode.requestFocus();
                        }else{
                          bool isValid = _guardController.checkValid();
                          if(isValid){
                            _guardController.passwordController.clear();
                            Get.off(()=> GuardianPwdCompletePage());
                          }else{
                            _guardController.passwordController.clear();
                            _focusNode.requestFocus();
                          }
                        }
                      },
                      obscuringWidget: Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                      ),
                      autoFocus: true,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.transparent,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: 19.39.h,
                        fieldWidth: 19.39.w,
                        inactiveColor: Colors.white,
                        activeFillColor: Colors.white,
                        activeColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedColor: Colors.white,
                        selectedFillColor: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
