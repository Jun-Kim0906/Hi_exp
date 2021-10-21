import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hi_app/models/user_model.dart';
import 'package:hi_app/repository/user_repository.dart';
import 'package:hi_app/widgets/default_dialog.dart';

enum AuthStatus {
  ///첫 앱 진입
  Uninitialized,

  ///가지고 있는 Auth가 없음
  Unauthenticated,

  ///Auth가짐
  Authenticated,
}

class UserController extends GetxController {
  FirebaseAuth _auth;
  UserRepository _userRepository;

  /// 0: non selected, 1: mom, 2: dad
  int _momOrDad = 0;

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  bool _isExist = false;

  AuthStatus _authStatus = AuthStatus.Uninitialized;

  AuthStatus get authStatus => _authStatus;

  FirebaseAuth get auth => _auth;

  int get momOrDad => _momOrDad;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get nameController => _nameController;

  bool get isExist => _isExist;

  UserModel user = UserModel.nullUserModel();

  UserController() {
    _auth = FirebaseAuth.instance;
    _userRepository = UserRepository();
    _auth.authStateChanges().listen(onAuthStateChanged);
  }

  void setStatus(AuthStatus authStatus) {
    _authStatus = authStatus;
    print(_authStatus);
    update();
  }

  ///엄마, 아빠 선택창
  void selectMomOrDad(int select) {
    _momOrDad = select;
    update();
  }

  ///아예 홈으로 나갔다 오면, 회원가입 정보 초기화
  void signupInfoReset({bool isLoginPage}) {
    _momOrDad = 0;
    _phoneNumberController.clear();
    _nameController.clear();
    _isExist = isLoginPage ?? false;
    update();
  }

  ///입력한 번호가 존재하는지 확인하기
  Future<void> isPhoneNumExist() async {
    _isExist =
        await _userRepository.isExistPhoneNum(_phoneNumberController.text);
    update();
  }

  ///이때, firebaseUserModel가 null이 아니라면 auth와 document가 둘 다 있어야함
  //Method to detect live auth changes such as user sign in and sign out
  Future<void> onAuthStateChanged(User firebaseUserModel) async {
    if (firebaseUserModel == null) {
      await Future.delayed(Duration(seconds: 3));
      if (_auth.currentUser == null) {
        setStatus(AuthStatus.Unauthenticated);
      }
    } else {
      await Future.delayed(Duration(seconds: 3));

      ///자동로그인
      setStatus(AuthStatus.Authenticated);
      if (FirebaseAuth.instance.currentUser != null)
        user = await UserRepository().getCurrentUser();
    }
    update();
  }

  Future<String> signIn(String phoneNum) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$phoneNum@hi.kr',
        password: '123456',
      );
      user = await UserRepository().getCurrentUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('해당 이메일로 등록된 사용자가 없습니다.');
        return '해당 이메일로 등록된 사용자가 없습니다.';
      } else if (e.code == 'wrong-password') {
        print('잘못된 비밀번호입니다.');
        return '잘못된 비밀번호입니다.';
      } else if (e.code == 'invalid-email') {
        print('유효하지 않은 이메일입니다.');
        return '유효하지 않은 이메일입니다.';
      } else {
        print('미처리 예외: $e');
        return '미처리 예외: $e';
      }
    }

    print('로그인 되었습니다.');
    return '로그인 되었습니다.';
  }

  Future<String> signUp() async {
    try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '${_phoneNumberController.text}@hi.kr',
        password: '123456',
      );
    } on FirebaseAuthException catch (e) {
      print(_phoneNumberController.text);
      if (e.code == 'weak-password') {
        print('비밀번호가 너무 간단합니다.');
        return '비밀번호가 너무 간단합니다.';
      } else if (e.code == 'email-already-in-use') {
        print('해당 이메일로 가입된 계정이 이미 존재합니다.');
        return '해당 이메일로 가입된 계정이 이미 존재합니다.';
      } else if (e.code == 'invalid-email') {
        print('유효하지 않은 이메일입니다.');
        return '유효하지 않은 이메일입니다.';
      } else {
        print('미처리 예외: ${e.code}');
        return '미처리 예외: ${e.code}';
      }
    } catch (e) {
      print('미처리 예외: $e');
      return '미처리 예외: $e';
    }

    await _userRepository.addUser(UserModel(
      phoneNum: _phoneNumberController.text,
      name: _nameController.text,
      isMomSelected: _momOrDad == 1 ? true : false,
    ));
    user = await UserRepository().getCurrentUser();

    print('회원가입에 성공했습니다.');
    return '회원가입에 성공했습니다.';
  }

  Future signOut() async {
    await _auth.signOut();
    _authStatus = AuthStatus.Unauthenticated;
    update();
    return Future.delayed(Duration.zero);
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  User getUser() {
    return _auth.currentUser;
  }

  Future verifyEmail() async {
    User user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      signOut();
      Get.dialog(DefaultDialog('이메일 인증이 필요합니다.\n이메일을 확인해주세요.'));
    }
  }

  void setUser(UserModel user) {
    this.user = user;
    update();
  }
}
