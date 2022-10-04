import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  ProfileViewModel(this._authenticationService);
  
  Future<bool> logout() async {
    return await _authenticationService.logout();
  }
}
