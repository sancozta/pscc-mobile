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
      textPadding: const EdgeInsets.only(top: 6, bottom: 6, right: 8, left: 8),
      radius: 10.0,
      textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      animationBuilder: const Miui10AnimBuilder(),
    );
  }

  static String identifiesError(dynamic error) {
    return generateMessageError(whatException(error));
  }

  static String generateMessageError(String errorCode) {
    switch (errorCode) {
      case 'ERROR_INVALID_EMAIL':
        return 'O seu endereço de email parece estar incorreto.';
      case 'ERROR_WRONG_PASSWORD':
        return 'Sua senha está errada.';
      case 'ERROR_USER_NOT_FOUND':
        return 'O usuário com este email não existe.';
      case 'ERROR_USER_DISABLED':
        return 'O usuário com este email foi desativado.';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'Muitos pedidos. Tente mais tarde.';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'O login com email e senha não está ativado.';
      case 'ERROR_OBJECT_NOT_FOUND':
        return 'Nenhum objeto na referência desejada.';
      case 'ERROR_BUCKET_NOT_FOUND':
        return 'Nenhum intervalo configurado para o Cloud Storage.';
      case 'ERROR_PROJECT_NOT_FOUND':
        return 'Nenhum projeto configurado para o Cloud Storage.';
      case 'ERROR_QUOTA_EXCEEDED':
        return 'A cota do intervalo do Cloud Storage foi excedida. Se você estiver no nível gratuito, faça upgrade para um plano pago. Se você usar um plano pago, entre em contato com o suporte do Firebase.';
      case 'ERROR_NOT_AUTHENTICATED':
        return 'O usuário não está autenticado. Faça a autenticação e tente novamente.';
      case 'ERROR_NOT_AUTHORIZED':
        return 'O usuário não está autorizado a executar a ação desejada. Verifique suas regras para garantir que elas estejam corretas.';
      case 'ERROR_RETRY_LIMIT_EXCEEDED':
        return 'O limite de tempo máximo em uma operação (upload, download, exclusão etc.) foi excedido. Tente novamente.';
      case 'ERROR_INVALID_CHECKSUM':
        return 'O arquivo no cliente não corresponde à soma de verificação do arquivo recebido pelo servidor. Envie novamente.';
      case 'ERROR_CANCELED':
        return 'O usuário cancelou a operação.';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'O endereço de email já está sendo usado por outra conta.';
      case 'ERROR_UNKNOWN':
        return 'Ocorreu um erro desconhecido.';
      case 'SIGN_IN_FAILED':
        return 'Falha ao Realizar Login.';
      case 'OBJECT_ERROR_IS_NULL':
        return 'Objeto error esta null.';
      case 'NETWORK_ERROR':
        return 'Verifique sua conexão de Internet.';
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
      debugPrint(e);
      return 'ERROR_UNKNOWN';
    }
  }
}
