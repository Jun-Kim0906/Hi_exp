import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key key, this.backPressed, this.confirmPressed,
  }) : super(key: key);

  final VoidCallback backPressed;
  final VoidCallback confirmPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80.75,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius:
          BorderRadius.only(topRight: Radius.circular(47.5))),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 47.0, right: 65.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: backPressed ?? defaultBack,
                icon: Icon(Icons.arrow_back_ios),
              ),
              TextButton(
                  onPressed: confirmPressed,
                  child: Text(
                    '확인',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
  void defaultBack() {
    Get.back();
  }
}
