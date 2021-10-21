import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:hi_app/pages/make_info_page.dart';
import 'package:hi_app/pages/make_take_page.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class MakeController extends GetxController {
  ///1: smile; 2: angry; 3: sad; 4: tired; 5: surprised
  int category;

  String infoComment;

  String subInfoComment;

  String path;

  String infoExp;

  String guide1;
  String guide2;
  String guide3;
  String guide4 = '찍힌 얼굴 사진을 휴대폰 사진첩에 저장\n하거나 다시 찍어보세요';

  List<CameraDescription> cameras;

  CameraController controller;

  int pageIndex=1;

  String takeImagePath;

  bool photoDownload = false;

  bool smileComplete = false;
  bool angryComplete = false;
  bool sadComplete = false;
  bool tiredComplete = false;
  bool surpriseComplete = false;


  void categorySelect(int category) async {
    this.category = category;
    switch (category) {
      case 1:
        infoComment = '내가 좋아하는 것을\n상상해보세요';
        subInfoComment = '상상을 하다가 행복한 기분이 들기 시작하면\n아래 버튼을 눌러주세요!';
        path = 'smile';
        infoExp = '웃는 표정';
        guide1 = '즐거운 상상을 기억하면서';
        guide2 = '을\n지어보세요';
        guide3 = '카메라에 그려진 선을 따라 입꼬리를\n올려보세요';
        break;
      case 2:
        infoComment = '지갑을 잃어버렸다고\n상상해보세요';
        subInfoComment = '상상을 하다가 행복한 화가 나기 시작하면\n아래 버튼을 눌러주세요!';
        path = 'angry';
        infoExp = '화난 표정';
        guide1 = '화나는 상상을 기억하면서';
        guide2 = '을\n지어보세요';
        guide3 = '카메라에 그려진 선을 따라 입꼬리를\n내리고 눈썹을 올려보세요';
        break;
      case 3:
        infoComment = '사랑하는 강아지가\n아프다고 상상해보세요';
        subInfoComment = '상상을 하다가 슬퍼지기 시작하면\n아래 버튼을 눌러주세요!';
        path = 'sad';
        infoExp = '슬픈 표정';
        guide1 = '슬픈 상상을 기억하면서';
        guide2 = '을\n지어보세요';
        guide3 = '카메라에 그려진 선을 따라 입꼬리를\n내리고 눈썹을 내려보세요';
        break;
      case 4:
        infoComment = '내 침대에서 자고있는\n나의 모습을 상상해보세요';
        subInfoComment = '상상을 하다가 잠이 오기 시작하면\n아래 버튼을 눌러주세요!';
        path = 'tired';
        infoExp = '졸린 표정';
        guide1 = '잠이 오는 상상을 기억하면서';
        guide2 = '을\n지어보세요';
        guide3 = '카메라에 그려진 선을 따라 눈을 감고\n입을 벌려보세요';
        break;
      case 5:
        infoComment = '풍선이 갑자기 펑\n터졌다고 생각해보세요';
        subInfoComment = '상상을 하다가 감정이 요동치면\n아래 버튼을 눌러주세요!';
        path = 'surprised';
        infoExp = '놀란 표정';
        guide1 = '풍선이 터지는 상상을 기억하면서\n';
        guide2 = '을 지어보세요';
        guide3 = '입을 최대한 크게 벌리고 눈을 크게\n떠보세요';
        break;
    }
    cameras = await availableCameras();
    if(cameras.isNotEmpty){
      controller = CameraController(cameras[1], ResolutionPreset.max,);
      controller.initialize().then((_) {
        update();
      });
    }
    Get.to(() => MakeInfoPage());
    update();
  }

  void toTakePage() {
    pageIndex = 1;
    Get.to(()=>MakeTakePage());
    update();
  }

  void toHintPage() {
    pageIndex = 2;
    update();
  }

  Future toTookPage() async{
    takeImagePath = await  controller.takePicture().then((value) => value.path);
    pageIndex = 3;
    update();
  }

  Future downloadPicture() async {
    ImageGallerySaver.saveFile(takeImagePath);
    photoDownload = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    photoDownload = false;
    update();
  }

  void retake(){
    pageIndex = 1;
    update();
  }

  bool success(){
    switch(category){
      case 1:
        smileComplete = true;
        break;
      case 2:
        angryComplete = true;
        break;
      case 3:
        sadComplete = true;
        break;
      case 4:
        tiredComplete = true;
        break;
      case 5:
        surpriseComplete = true;
        break;
    }
    update();

    return smileComplete && angryComplete && sadComplete && tiredComplete && surpriseComplete ;
  }
}
