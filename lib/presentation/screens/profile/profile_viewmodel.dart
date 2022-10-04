import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/subscription_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;
  final SubscriptionService _subscriptionService;


  ProfileViewModel(this._authenticationService, this._subscriptionService);

  Future<bool> logout() async {
    return await _authenticationService.logout();
  }
}
