import 'package:get/get.dart';
import 'package:hi_app/models/read_model.dart';
import 'package:hi_app/repository/read_repository.dart';

class ReadController extends GetxController {
  List<ReadModel> readModels = [];

  int currentIndex = 0;

  ReadModel currentProblem;

  void getProblems(int category) async {
    readModels = await ReadRepository().getRead(category);
    currentIndex = 15;
    print(readModels.length);
    currentProblem = readModels[currentIndex];
    update();
  }

  void nextProblem() {
    if (currentIndex + 1 != readModels.length)
      currentProblem = readModels[++currentIndex];
    update();
  }

  bool isLastProblem(){
    if(currentIndex + 1 == readModels.length)
      return true;
    return false;
  }

  bool isCorrect(int selected) {
    if (currentProblem.answer == selected) {
      return true;
    } else {
      return false;
    }
  }
}
