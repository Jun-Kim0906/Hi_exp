import 'package:get/get.dart';

class SettingController extends GetxController{
  bool alarm = false;

  double vol = 0;
  double textSize= 0;

  void switchStatus(bool alarm){
    this.alarm = alarm;
    update();
  }

  void adjustVol(double vol){
    this.vol = vol;
    update();
  }

  void adjustText(double size){
    this.textSize = size;
    update();
  }
}