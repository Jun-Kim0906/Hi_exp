import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hi_app/controllers/user_controller.dart';
import 'package:hi_app/pages/home_page.dart';
import 'package:hi_app/pages/login_page.dart';
import 'package:hi_app/utils/hi_theme.dart';

import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 896),
        builder: () => GetMaterialApp(
              builder: (context, widget) {
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget,
                );
              },
              debugShowCheckedModeBanner: false,
              theme: HiTheme.lightThemeData,
              home: GetBuilder<UserController>(
                init: UserController(),
                builder: (_) {
                  if (_.authStatus == AuthStatus.Uninitialized) {
                    return SplashPage();
                  } else if (_.authStatus == AuthStatus.Authenticated) {
                    return HomePage();
                  } else if (_.authStatus == AuthStatus.Unauthenticated) {
                    return LoginPage();
                  } else {
                    return SplashPage();
                  }
                },
              ),
          getPages: [
            GetPage(name: '/', page: () => HomePage()),
            GetPage(
                name: '/login',
                page: () => LoginPage(),
                transitionDuration: Duration(seconds: 0)),
          ],
            ));
  }
}
