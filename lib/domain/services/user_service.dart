import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/order.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

class UserService {
  final UserRepository _userRepository;
  final AuthenticationService _authenticationService;

  UserService(this._userRepository, this._authenticationService);

  Future<String> attachPaymentMethodToUser(PaymentMethodType type, String externalPaymentMethodId) {
    return _userRepository.attachPaymentMethodToUser(type, externalPaymentMethodId);
  }

  Future<bool> changePassword(String currentPassword, String newPassword) {
    return _userRepository.changePassword(currentPassword, newPassword);
  }

  Future<String> createSetupIntent(PaymentMethodType paymentMethodType) {
    String userId = _authenticationService.credentials!.user.id!;
    return _userRepository.createSetupIntent(userId, paymentMethodType);
  }

  Future<User> createUser(CreateProfileUserRequest user) {
    return _userRepository.createUser(user);
  }

  Future<List<User>> getAll(String param) {
    return _userRepository.getAll(param);
  }

  Future<User> getById(String id) {
    return _userRepository.getById(id);
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

  Future<User> patchById(String id, User entity) {
    return _userRepository.patchById(id, entity);
  }

  Future<LanguagePair> patchLanguagePairBySourceTargetLanguagesIds(String sourceLanguageId, String targetLanguageId) {
    return _userRepository.patchLanguagePairBySourceTargetLanguagesIds(sourceLanguageId, targetLanguageId);
  }

  Future<User> post(User entity) {
    return _userRepository.post(entity);
  }

  Future<bool> removeById(String id) {
    return _userRepository.removeById(id);
  }

  Future<bool> removePaymentMethod(PaymentMethodType paymentMethodType, String externalId) {
    return _userRepository.removePaymentMethod(paymentMethodType, externalId);
  }
}
