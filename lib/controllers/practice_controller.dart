import 'package:get/get.dart';

class PracticeController extends GetxController {
  int pageIndex = 1;
  int object = -1;

  String objectPath;

  bool aniStart = false;

  void selectObject(int object) {
    this.object = object;
    update();
  }

  Future<void> nextPage() async {
    this.pageIndex++;
    switch (this.object) {
      case 1:
        this.objectPath = 'car';
        break;
      case 2:
        this.objectPath = 'note';
        break;
      case 3:
        this.objectPath = 'rocket';
        break;
      case 4:
        this.objectPath = 'robot';
        break;
      case 5:
        this.objectPath = 'wood';
        break;
    }
    update();
    print(pageIndex);
    for (; this.pageIndex <= 5; this.pageIndex++) {
      await Future.delayed(Duration(seconds: 3), () {
        print('${this.pageIndex}abc');
        update();

        if (this.pageIndex == 2) {
          Future.delayed(Duration(seconds: 3, milliseconds:20 )).then((value){
            this.aniStart = true;
            update();
            print(aniStart);
          });
        }
      });
    }
    await Future.delayed(Duration(seconds: 13), (){
      this.pageIndex ++;
      update();
    });
  }
}
