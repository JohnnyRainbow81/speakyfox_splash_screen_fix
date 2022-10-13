import 'package:speakyfox/data/repositories_impls/user_repository_impl.dart';
import 'package:speakyfox/data/requests/change_password_request.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/order.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class UserService extends BaseService<User> {
  late final UserRepository _userRepository;
  final AuthenticationService _authenticationService;
  User? _user;

  UserService(UserRepositoryImpl userRepositoryImpl, this._authenticationService) : super(userRepositoryImpl) {
    _userRepository = userRepositoryImpl;
  }

  User get user => _user ?? _authenticationService.getUser()!;

  Future<String> attachPaymentMethodToUser(PaymentMethodType type, String externalPaymentMethodId) {
    return _userRepository.attachPaymentMethodToUser(type, externalPaymentMethodId);
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    return _userRepository.changePassword(ChangePasswordRequest(
        currentPassword: currentPassword, newPassword: (_authenticationService.getCredentials())!.user.password));
  }

  Future<String> createSetupIntent(PaymentMethodType paymentMethodType) async {
    return _userRepository.createSetupIntent(user.id, paymentMethodType);
  }

//Do we need this? > AuthenticationService already has "register" with same functionality
  Future<User> createUser(CreateProfileUserRequest userRequest) {
    return _userRepository.createUser(userRequest);
  }

  Future<Order> getOrdersOfCurrentUser() {
    return _userRepository.getOrdersOfCurrentUser(user.id);
  }

  Future<List<UserPaymentMethod>> getPaymentMethods() {
    throw UnimplementedError();
  }

  Future<List<Subscription>> getSubscriptions() {
    String id = _authenticationService.getUser()!.id;

    return _userRepository.getSubscriptions(id);
  }

  Future<LanguagePair> patchLanguagePairBySourceTargetLanguagesIds(String sourceLanguageId, String targetLanguageId) {
    return _userRepository.patchLanguagePairBySourceTargetLanguagesIds(sourceLanguageId, targetLanguageId);
  }

  Future<bool> removePaymentMethod(String id, PaymentMethodType paymentMethodType, String externalId) {
    String id = _authenticationService.getUser()!.id!;
    return _userRepository.removePaymentMethod(id, paymentMethodType, externalId);
  }

  Future createSubscription(String userId, SubscriptionCreateRequest subscription) {
    return _userRepository.createSubscription(userId, subscription);
  }

}
