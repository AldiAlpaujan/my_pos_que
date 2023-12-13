part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const login = _Paths.login;
  static const signup = _Paths.signup;
  static const home = _Paths.home;
}

abstract class _Paths {
  _Paths._();

  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
}
