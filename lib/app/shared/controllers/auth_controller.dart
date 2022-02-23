import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:pscc/app/app_pages.dart';
import 'package:pscc/app/shared/services/handler_error_service.dart';
import 'package:pscc/app/shared/services/messaging_service.dart';
import 'package:pscc/app/shared/services/auth_service.dart';
import 'package:pscc/app/shared/controllers/auth_enum.dart';
import 'package:pscc/app/shared/models/user_local.dart';

class AuthController extends GetxController {
  final AuthService auth = Get.find();
  final MessagingService messaging = Get.find();

  Rx<AuthEnum> status = AuthEnum.logoff.obs;
  Rx<UserLocal> data = UserLocal().obs;
  RxBool registrationCompleted = true.obs;

  AuthController() {
    reloadUser();
    initDynamicLinks();
  }

  Future initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink!.link;

        if (deepLink != null) {
          printInfo(info: deepLink.path);
        }
      },
      onError: (OnLinkErrorException error) async {
        HandlerErrorService.showMsgError(error);
      },
    );

    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();

    if (data != null) {
      final Uri? deepLink = data.link;
      printInfo(info: deepLink!.path);
    }
  }

  Future userLoggedMarked(User? user) async {
    if (user != null && user.uid.isNotEmpty) {
      status.value = user.uid.isEmpty ? AuthEnum.logoff : AuthEnum.login;

      if (user.uid.isNotEmpty) {
        await registerOrUpdateUser(user);
      } else {
        printInfo(info: 'Usuário não Identificado!');
      }
    }
  }

  Future registerOrUpdateUser(User user) async {
    messaging.initFirebaseListeners();
    String? token = await messaging.getTokenUserCurrent();

    await auth.selectUser(user.uid).then((doc) async {
      if (doc != null && doc.uid!.isNotEmpty) {
        data.value = doc;
        data.value.token = token;
        await auth.updateUser(data.value);
      } else {
        data.value = UserLocal(
          uid: user.uid,
          email: user.email,
          name: user.displayName,
          phone: user.phoneNumber,
          photo: user.photoURL,
          token: token,
        );
        await auth.insertUser(data.value);
      }

      registrationCompleted.value = data.value.isRegistrationCompleted();
    }).catchError((e) {
      registrationCompleted.value = false;
      HandlerErrorService.showMsgError(e);
    });
  }

  Future createWithEmailAndPassword(UserLocal data, String password) async {
    await auth.insertUserEmailPassword(data.email ?? '', password).then((userCreated) {
      if (userCreated.user != null) {
        data.uid = userCreated.user!.uid;
        auth.insertUser(data);
      }
    }).catchError((e) {
      HandlerErrorService.showMsgError(e);
    });
  }

  Future loginWithEmailAndPassword(String email, String password) async {
    await auth.selectUserEmailPassword(email, password).then((u) async {
      await userLoggedMarked(u);
    }).catchError((e) {
      HandlerErrorService.showMsgError(e);
    });
  }

  Future loginWithGoogle() async {
    await auth.getGoogleLogin().then((u) async {
      await userLoggedMarked(u);
      Get.offAllNamed(Routes.home);
    }).catchError((e) {
      HandlerErrorService.showMsgError(e);
    });
  }

  Future updateDataUserLoggedMarked(UserLocal data) async {
    await auth.updateUser(data).then((u) async {
      await userLoggedMarked(u);
    }).catchError((e) {
      HandlerErrorService.showMsgError(e);
    });
  }

  reloadUser() {
    userLoggedMarked(auth.getUserFire());
  }

  recoverPass(String email) {
    auth.recoverPassword(email);
  }

  logout() {
    return auth.getLogout();
  }
}
