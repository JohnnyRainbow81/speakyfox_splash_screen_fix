class UIException implements Exception {
  int code;
  String message;
  String description;
  UIException({
    this.code = 0,
    this.message = "Oops",
    this.description = "An Error happened. We are sorry.",
  });
}

class CannotRecoverUIException extends UIException {
  CannotRecoverUIException({int? code, String? message, String? description})
      : super(
            code: code ?? 0,
            message: message ?? "We are sorry.",
            description: description ?? "There was an error we couldn't recover from. Please restart the app.");
}

class VideoLoadingFailureUIException extends UIException {
  VideoLoadingFailureUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Sorry.",
          description: description ?? "We couldn't load your video feed.",
        );
}

class NoVideosAvailableUIException extends UIException {
  NoVideosAvailableUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "No Videos available.",
          description: description ?? "We couldn't find any matching your preferences.",
        );
}

class NoInternetConnectionUIException extends UIException {
  NoInternetConnectionUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "No Internet.",
          description: description ?? "Internet Connection is not available.",
        );
}

class TimeOutUIException extends UIException {
  TimeOutUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Time out error",
          description: description ?? "Something is taken too long here.",
        );
}

class FileSystemUIException extends UIException {
  FileSystemUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "File system error.",
          description: description ?? "We're having trouble getting or saving data on your device.",
        );
}

class HttpUIException extends UIException {
  HttpUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Server communication error",
          description: description ?? "We're having trouble sending or receiving data from the web",
        );
}

class ConnectTimeOutUIException extends UIException {
  ConnectTimeOutUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Connection timeout",
          description: description ?? "Currently having trouble to connect to our servers.",
        );
}

class SendTimeOutUIException extends UIException {
  SendTimeOutUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Timeout sending data",
          description: description ?? "We couldn't send data to our servers.",
        );
}

class ReceiveTimeOutUIException extends UIException {
  ReceiveTimeOutUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Receiving data timeout",
          description: description ?? "We couldn't receive data from our servers.",
        );
}

class SocketUIException extends UIException {
  SocketUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Socket connection error",
          description: description ?? "We're having trouble with connecting your device to our server for back and forth data exchange",
        );
}

class WebSocketUIException extends UIException {
  WebSocketUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Websocket connection error",
          description: description ?? "We're having trouble with connecting your device to our server for back and forth data exchange",
        );
}

class IOUIException extends UIException {
  IOUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "I/O error",
          description: description ?? "We have an Input/Output error.",
        );
}

class BadRequestUIException extends UIException {
  BadRequestUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Bad request error",
          description: description ?? "Our server couldn't handle your device's request.",
        );
}

class UnauthenticateddUIException extends UIException {
  UnauthenticateddUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Fehler bei der Authentifizierung",
          description: description ?? "Leider konnte unser Server dich nicht identifizieren.",
        );
}

class LoginNotSuccessfulException extends UIException {
  LoginNotSuccessfulException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Login was not successful",
          description: description ?? "Please try again.",
        );
}

class LoggedOutException extends UIException {
  LoggedOutException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Your session was logged out.",
          description: description ?? "Please log in again with your username and password.",
        );
}

class LogoutNotSuccessfulException extends UIException {
  LogoutNotSuccessfulException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Logout nicht erfolgreich.",
          description: description ?? "Wir konnten dich leider nicht ausloggen.",
        );
}

class UserException extends UIException {
  UserException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "We couldn't fetch your user data from our server.",
          description: description ?? "Please try again.",
        );
}

class ResetPasswordException extends UIException{
  ResetPasswordException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "We are having trouble resetting your password.",
          description: description ?? "Please try again.",
        );
}

class NotFoundUIException extends UIException {
  NotFoundUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Couldn't find resource",
          description: description ?? "A resource you asked for could not be found on our servers.",
        );
}

class InternalErrorException extends UIException {
  InternalErrorException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Internal Server Error",
          description: description ?? "A situation occured our server couldn't handle.",
        );
}

class NoPreferencesFoundException extends UIException {
  NoPreferencesFoundException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Couldn't access preferences",
          description: description ?? "We couldn't access your device's preferences to load or save a setting",
        );
}

class CacheLoadingException extends UIException {
  CacheLoadingException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Data not found in local storage",
          description: description ?? "Couldn't load data from local storage",
        );
}

class CacheSavingException extends UIException {
  CacheSavingException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Data storage error",
          description: description ?? "Couldn't save data in local storage",
        );
}

class CacheClearingException extends UIException {
  CacheClearingException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Data storage error",
          description: description ?? "Couldn't clear data in local storage",
        );
}

class PaymentException extends UIException {
   PaymentException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Payment error",
          description: description ?? "Something went wrong with your payment option.",
        );
}


class EmailNotFoundException extends UIException {
   EmailNotFoundException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Email nicht gefunden",
          description: description ?? "Wir konnten deine E-Mail Adresse leider nicht in unserem System finden",
        );
}

class UserNotFoundException extends UIException {
   UserNotFoundException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "User not found",
          description: description ?? "We couldn't find any user with this name in our system",
        );
}

class WrongPasswordException extends UIException {
   WrongPasswordException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Falsches Password?",
          description: description ?? "Dieses Password passt nicht zur E-Mail-Adresse",
        );
}


class UserPasswordCoupleInvalidException extends UIException {
   UserPasswordCoupleInvalidException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Login fehlgeschlagen",
          description: description ?? "Diese E-Mail/Password Kombination existiert leider nicht.",
        );
}

class NotImplementedYetException extends UIException {
   NotImplementedYetException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Not implemented yet",
          description: description ?? "...but will be available soon.",
        );
}

class RegistrationFailedException extends UIException {
   RegistrationFailedException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Registrierung fehlgeschlagen",
          description: description ?? "Leider konnten wir keinen Account für dich anlegen.",
        );
}
