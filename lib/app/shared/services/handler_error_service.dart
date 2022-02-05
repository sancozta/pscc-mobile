import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';

class HandlerErrorService {
  static showMsgError(dynamic error) {
    return showToast(
      identifiesError(error),
      position: ToastPosition.bottom,
      backgroundColor: Colors.black45,
      textPadding: EdgeInsets.only(top: 6, bottom: 6, right: 8, left: 8),
      radius: 10.0,
      textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      animationBuilder: Miui10AnimBuilder(),
    );
  }

  static String identifiesError(dynamic error) {
    return generateMessageError(whatException(error));
  }

  static String generateMessageError(String errorCode) {
    switch (errorCode) {
      case 'ERROR_INVALID_EMAIL':
        return 'O seu endereço de email parece estar incorreto.';
        break;
      case 'ERROR_WRONG_PASSWORD':
        return 'Sua senha está errada.';
        break;
      case 'ERROR_USER_NOT_FOUND':
        return 'O usuário com este email não existe.';
        break;
      case 'ERROR_USER_DISABLED':
        return 'O usuário com este email foi desativado.';
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'Muitos pedidos. Tente mais tarde.';
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'O login com email e senha não está ativado.';
        break;
      case 'ERROR_OBJECT_NOT_FOUND':
        return 'Nenhum objeto na referência desejada.';
        break;
      case 'ERROR_BUCKET_NOT_FOUND':
        return 'Nenhum intervalo configurado para o Cloud Storage.';
        break;
      case 'ERROR_PROJECT_NOT_FOUND':
        return 'Nenhum projeto configurado para o Cloud Storage.';
        break;
      case 'ERROR_QUOTA_EXCEEDED':
        return 'A cota do intervalo do Cloud Storage foi excedida. Se você estiver no nível gratuito, faça upgrade para um plano pago. Se você usar um plano pago, entre em contato com o suporte do Firebase.';
        break;
      case 'ERROR_NOT_AUTHENTICATED':
        return 'O usuário não está autenticado. Faça a autenticação e tente novamente.';
        break;
      case 'ERROR_NOT_AUTHORIZED':
        return 'O usuário não está autorizado a executar a ação desejada. Verifique suas regras para garantir que elas estejam corretas.';
        break;
      case 'ERROR_RETRY_LIMIT_EXCEEDED':
        return 'O limite de tempo máximo em uma operação (upload, download, exclusão etc.) foi excedido. Tente novamente.';
        break;
      case 'ERROR_INVALID_CHECKSUM':
        return 'O arquivo no cliente não corresponde à soma de verificação do arquivo recebido pelo servidor. Envie novamente.';
        break;
      case 'ERROR_CANCELED':
        return 'O usuário cancelou a operação.';
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'O endereço de email já está sendo usado por outra conta.';
        break;
      case 'ERROR_UNKNOWN':
        return 'Ocorreu um erro desconhecido.';
        break;
      case 'SIGN_IN_FAILED':
        return 'Falha ao Realizar Login.';
        break;
      case 'OBJECT_ERROR_IS_NULL':
        return 'Objeto error esta null.';
        break;
      case 'NETWORK_ERROR':
        return 'Verifique sua conexão de Internet.';
        break;
      default:
        return errorCode;
    }
  }

  static String whatException(dynamic e) {
    if (e == null) {
      return 'OBJECT_ERROR_IS_NULL';
    } else if (e is PlatformException) {
      return e.code.toString().toUpperCase();
    } else if (e is FirebaseAuthException) {
      return e.code.toString().toUpperCase();
    } else if (e is FormatException) {
      return e.message.toString().toUpperCase();
    } else if (e is HttpException) {
      return e.message.toString().toUpperCase();
    } else if (e is TimeoutException) {
      return e.message.toString().toUpperCase();
    } else if (e is CertificateException) {
      return e.message.toString().toUpperCase();
    } else if (e is Exception) {
      return e.hashCode.toString().toUpperCase();
    } else if (e is ProcessException) {
      return e.message.toString().toUpperCase();
    } else {
      print('ERROR_UNKNOWN');
      print(e);
      return 'ERROR_UNKNOWN';
    }
  }
}
