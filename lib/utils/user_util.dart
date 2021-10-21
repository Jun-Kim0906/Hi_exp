import 'package:hi_app/models/user_model.dart';

class UserUtil {
  static UserModel _user;
  static void setUser(UserModel user) async {
    _user = user;
  }

  static UserModel getUser() {
    return _user;
  }
}