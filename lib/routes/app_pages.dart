import 'package:get/get.dart';
import 'package:my_pos_que/view/login/login.controller.dart';
import 'package:my_pos_que/view/login/login.page.dart';
import 'package:my_pos_que/view/signup/signup.controller.dart';
import 'package:my_pos_que/view/signup/signup.page.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static get _transition => Transition.fadeIn;
  static get initialRoute => Routes.login;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder.put(() => LoginController()),
      transition: _transition,
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpPage(),
      binding: BindingsBuilder.put(() => SignUpController()),
      transition: _transition,
    ),
  ];
}
