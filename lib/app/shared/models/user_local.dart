import 'package:pscc/app/shared/services/util_service.dart';

class UserLocal {
  String? uid;
  String? cpf;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? token;
  bool? admin;
  bool? verify;

  UserLocal({
    this.uid,
    this.cpf,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.token,
    this.admin,
    this.verify,
  });

  UserLocal.copyWith(UserLocal data) {
    uid = data.uid ?? '';
    cpf = data.cpf ?? '';
    name = data.name ?? '';
    email = data.email ?? '';
    phone = data.phone ?? '';
    photo = data.photo ?? '';
    token = token ?? '';
    admin = admin ?? false;
    verify = verify ?? false;
  }

  UserLocal.fromMap(String id, Map data) {
    uid = id;
    cpf = data['cpf'] ?? '';
    name = data['name'] ?? '';
    email = data['email'] ?? '';
    phone = data['phone'] ?? '';
    photo = data['photo'] ?? '';
    token = data['token'] ?? '';
    admin = data['admin'] ?? false;
    verify = data['verify'] ?? false;
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'cpf': cpf,
      'name': name,
      'email': email,
      'phone': phone,
      'photo': photo,
      'token': token,
      'admin': admin,
      'verify': verify,
    };
  }

  bool isRegistrationCompleted() {
    return cpf!.isNotEmpty && name!.isNotEmpty && email!.isNotEmpty && phone!.isNotEmpty;
  }

  static collection() {
    return 'users';
  }

  bool get isNameValid => name!.length >= 5;

  bool get isEmailValid => UtilService.isValueEmailValid(email!);

  bool get isPhoneValid => phone!.length >= 9;

  bool get isCpfValid => cpf!.length == 14;

  bool get isCpfInvalid => cpf!.length != 14;

  bool get isUserValid => isNameValid && isEmailValid && isPhoneValid && isCpfValid;
}
