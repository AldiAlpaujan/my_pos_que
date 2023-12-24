import 'package:get/get.dart';
import 'package:my_pos_que/view/home/home.controller.dart';
import 'package:my_pos_que/view/home/home.page.dart';
import 'package:my_pos_que/view/login/login.controller.dart';
import 'package:my_pos_que/view/login/login.page.dart';
import 'package:my_pos_que/view/signup/signup.controller.dart';
import 'package:my_pos_que/view/signup/signup.page.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static get _transition => Transition.fadeIn;
  static get initialRoute => _Paths.login;

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder.put(() => LoginController()),
      transition: _transition,
    ),
    GetPage(
      name: _Paths.signup,
      page: () => const SignUpPage(),
      binding: BindingsBuilder.put(() => SignUpController()),
      transition: _transition,
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      binding: BindingsBuilder.put(() => HomeController()),
      transition: _transition,
    ),
  ];
}
