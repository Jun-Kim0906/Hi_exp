import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hi_app/models/user_model.dart';
import 'package:hi_app/services/firebase_path.dart';
import 'package:hi_app/services/firestore_service.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirestoreService _firestoreService = FirestoreService.instance;

  FirebaseStorage storage;

  UserRepository({
    FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance {
    storage = FirebaseStorage.instance;
  }

  Future<void> addUser(UserModel user) async {
    await _firestoreService.setData(
        path: FirestorePath.user(user.phoneNum), data: user.toMap());
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  User getUser() {
    return _firebaseAuth.currentUser;
  }

  Future<UserModel> getCurrentUser() async {
    var user = UserModel.fromDs((await _firestoreService.getData(
        path: FirestorePath.user(getUser().email.split("@")[0])))
        .data());
    return user;
  }


  Future<bool> isExistPhoneNum(String phoneNum) async {
    try{
      if((await _firestoreService.getData(path: FirestorePath.user(phoneNum))).exists){
        return true;
      }
      return false;
    } catch(e){
      return true;
    }
  }

  Stream<UserModel> getUserFromUid(String uid) =>
      _firestoreService.documentStream(
        path: FirestorePath.user(uid),
        builder: (data, docID) => UserModel.fromDs(data),
      );

  Future<void> updateUser(UserModel userModel) async {
    try {
      await _firestoreService.setData(
        path: FirestorePath.user(userModel.phoneNum),
        data: userModel.toMap(),
      );
    } catch (e) {
      print('유저 업데이트 에러: ${e.toString()}');
    }
  }

  Future<void> deleteUser() async {
    final _fUser = getUser();

    await _firestoreService.deleteData(path: FirestorePath.user(_fUser.uid));
    await Future.delayed(Duration(seconds: 3));
    await _fUser.delete().catchError((error) {
      print("유저 삭제 에러 : ${error.toString()}");
    });
  }
}
