import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';

class ConnectivityService {
  bool _isWIFI = false;
  bool _isMobile = false;
  bool _isNone = true;

  bool get isWIFI => _isWIFI;
  bool get isMobile => _isMobile;
  bool get isNone => _isNone;

  Future<bool> hasConnection() async {
    //reset status info
    _isMobile = false;
    _isWIFI = false;
    _isNone = false;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      switch (connectivityResult) {
        case ConnectivityResult.mobile:
          _isMobile = true;
          break;
        case ConnectivityResult.wifi:
          _isWIFI = true;
          break;
        case ConnectivityResult.none:
          _isNone = true;
          break;
        default:
          _isNone = true;
      }

      return _isMobile || _isWIFI;
    } catch (e) {
      ErrorHandler.handleError(e);
    }
    return false;
  }
}
