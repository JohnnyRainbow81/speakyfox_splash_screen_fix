import 'package:speakyfox/data/repositories_impls/user_repository_impl.dart';
import 'package:speakyfox/data/requests/change_password_request.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/order.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class UserService extends BaseService<User> {
  late final UserRepository _userRepository;
  final AuthenticationService _authenticationService;

  UserService(UserRepositoryImpl userRepositoryImpl, this._authenticationService) : super(userRepositoryImpl) {
    _userRepository = userRepositoryImpl;
  }

  Future<User> getCurrentUser() {
    _userRepository.getCurrentUser();
  }

  Future<String> attachPaymentMethodToUser(PaymentMethodType type, String externalPaymentMethodId) {
    return _userRepository.attachPaymentMethodToUser(type, externalPaymentMethodId);
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    return _userRepository.changePassword(ChangePasswordRequest(
        currentPassword: currentPassword, password: (await _authenticationService.getCredentials())!.user.password));
  }

  Future<String> createSetupIntent(PaymentMethodType paymentMethodType) async {
    String userId = (await _authenticationService.getCredentials())!.user.id!;
    return _userRepository.createSetupIntent(userId, paymentMethodType);
  }

//Do we need this? > AuthenticationService already has "register" with same functionality
  Future<User> createUser(CreateProfileUserRequest user) {
    return _userRepository.createUser(user);
  }

  Future<Order> getOrdersOfCurrentUser() {
    return _userRepository.getOrdersOfCurrentUser();
  }

  Future<List<UserPaymentMethod>> getPaymentMethods() {
    throw UnimplementedError();
    //Angular code, translate to Dart:
    //   return of([
    //   Object.assign(new UserCreditCard(), {
    //     brand: 'Visa',
    //     lastFourDigits: '4929',
    //     created: moment(),
    //     expiryMonth: 4,
    //     expiryYear: 2023
    //   }),
    //   Object.assign(new UserPayPal(), {
    //     email: 'julien.ambos@ja-developer.de'
    //   }),
    //   Object.assign(new UserSepaDirectDebit(), {
    //     lastFourDigits: '0293',
    //     bankName: 'Deutsche Kreditbank'
    //   })
    // ] as any);
  }

  Future<Subscription> getSubscriptions() {
    return _userRepository.getSubscriptions();
  }

  Future<LanguagePair> patchLanguagePairBySourceTargetLanguagesIds(String sourceLanguageId, String targetLanguageId) {
    return _userRepository.patchLanguagePairBySourceTargetLanguagesIds(sourceLanguageId, targetLanguageId);
  }

  Future<bool> removePaymentMethod(PaymentMethodType paymentMethodType, String externalId) {
    return _userRepository.removePaymentMethod(paymentMethodType, externalId);
  }
}
