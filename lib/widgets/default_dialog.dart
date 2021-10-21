import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultDialog extends StatelessWidget {
  var screenSize = Get.mediaQuery.size;
  var textTheme = Get.textTheme;
  final text;
  final title;

  DefaultDialog(this.text, {this.title = '알림'});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Center(
        child: Container(
          width: screenSize.width * 0.5,
          height: screenSize.width * 0.4,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: textTheme.bodyText1.copyWith(color: Colors.black),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Text(
                text,
                style: textTheme.bodyText1.copyWith(color: Colors.black),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              TextButton(onPressed: () => Get.back(), child: Text('확인')),
            ],
          ),
        ),
      ),
    );
  }
}
