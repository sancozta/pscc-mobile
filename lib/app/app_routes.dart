part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SOLICITATION = _Paths.SOLICITATION;
  static const SHOPPING = _Paths.SHOPPING;
  static const PREFERENCES = _Paths.PREFERENCES;
  static const PRODUCT = _Paths.PRODUCT;
  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
  static const PERSONAL = _Paths.PERSONAL;
  static const ADRESSES = _Paths.ADRESSES;
  static const PAYMENTS = _Paths.PAYMENTS;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
  static const SOLICITATION = '/solicitation';
  static const SHOPPING = '/shopping';
  static const PREFERENCES = '/preferences';
  static const PRODUCT = '/product';
  static const NOTIFICATIONS = '/notifications';
  static const PERSONAL = '/personal';
  static const ADRESSES = '/adresses';
  static const PAYMENTS = '/payments';
}
