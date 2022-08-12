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

class UnauthorizedUIException extends UIException {
  UnauthorizedUIException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Unauthorized error",
          description: description ?? "Authentication is necessary, says our server.",
        );
}

class LoginNotSuccessfullException extends UIException {
  LoginNotSuccessfullException({int? code, String? message, String? description})
      : super(
          code: code ?? 0,
          message: message ?? "Login was not successful",
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



