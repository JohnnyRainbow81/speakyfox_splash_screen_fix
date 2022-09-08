import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';


enum Errors { emailNotFound, userNotFound, wrongPassword }

    //Main tasks:
    //-swallow Framework/library-Exceptions/own enum-defined Errors
    //-send Error/Exception for investigation to Crashlytics backend
    //-throw own UIExceptions to show to the users
class ErrorHandler {
  ErrorHandler._();

  static void handleError(dynamic error) {

    debugPrint("****Caught by ErrorHandler*****");
    debugPrint("ERROR: ${error.runtimeType}");

    //Dio/-Retrofit errors
    if (error is DioError) {
      _handleDioException(error);
    }

    //General errors
    if (error is Exception) {
      switch (error.runtimeType) {
        case TimeoutException:
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "TimeoutException");
          throw TimeOutUIException();
        case FileSystemException:
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "FileSystemException");
          throw FileSystemUIException();
        case HttpException:
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "HttpException");
          throw HttpUIException();
        case SocketException:
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "SocketException");
          throw SocketUIException();
        case WebSocketException:
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "WebSocketException");
          throw WebSocketUIException();
        case IOException:
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "IOException");
          throw IOUIException();
        default:
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "DefaultException");
          throw UIException();
      }
    } else if (error is Errors) {
      switch (error) {
        case Errors.emailNotFound:
          throw EmailNotFoundException();
        case Errors.wrongPassword:
          throw WrongPasswordException();
        case Errors.userNotFound:
          throw UserNotFoundException();
      }
    } else if (error is Error) {
      //Errors should crash the app, because the app possibly won't be in recoverable state afterwards,
      //says the internet. Current philosophy: Show error message to the user (if possible)
      //and let the user restart the app by herself, by pressing a "restart" button or similar.
      //If it's no more possible the show a restart option, a black screen with an error message will
      //be shown. See the error handling widgets in presentation layer.
      FirebaseCrashlytics.instance.recordError(error, StackTrace.current, reason: "Error", fatal: true);
      throw Error();
    }
  }

  static void _handleDioException(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "connectTimeOut");
        throw ConnectTimeOutUIException();
      case DioErrorType.sendTimeout:
        FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "sendTimeout");
        throw SendTimeOutUIException();
      case DioErrorType.receiveTimeout:
        FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "receiveTimeout");
        throw ReceiveTimeOutUIException();
      case DioErrorType.response:
        switch (dioError.response?.statusCode) {
          case HttpStatus.badRequest:
            //TODO  switch(internalCode) for finer Error Handling
            FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "badRequest");
            throw BadRequestUIException(code: dioError.response?.statusCode);
          case HttpStatus.forbidden:
            FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "forbidden");
            throw HttpUIException(code: dioError.response?.statusCode);
          case HttpStatus.unauthorized:
            FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "unauthorized");
            throw UnauthorizedUIException(code: dioError.response?.statusCode);
          case HttpStatus.notFound:
            FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "notFound");
            throw NotFoundUIException(code: dioError.response?.statusCode);
          case HttpStatus.internalServerError:
            FirebaseCrashlytics.instance
                .recordError(dioError.error, dioError.stackTrace, reason: "internalServerError");
            throw InternalErrorException(code: dioError.response?.statusCode);
          default:
            throw HttpUIException();
        }
      case DioErrorType.cancel:
        FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "cancel");
        throw HttpUIException();
      case DioErrorType.other:
        FirebaseCrashlytics.instance.recordError(dioError.error, dioError.stackTrace, reason: "other dio error");
        throw HttpUIException();
    }
  }
}
