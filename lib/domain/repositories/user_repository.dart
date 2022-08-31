import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/order.dart';
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/models/user_payment_method.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';

abstract class UserRepository extends BaseRepository<User> {
  Future<User> createUser(CreateProfileUserRequest user);
  Future<String> attachPaymentMethodToUser(PaymentMethodType type, String externalPaymentMethodId);
  Future<Order> getOrdersOfCurrentUser();
  Future<Subscription> getSubscriptions();
  Future<bool> changePassword(String currentPassword, String newPassword);
  Future<LanguagePair> patchLanguagePairBySourceTargetLanguagesIds(String sourceLanguageId, String targetLanguageId);

  Future<String> createSetupIntent(String userId, PaymentMethodType paymentMethodType);
  Future<bool> removePaymentMethod(PaymentMethodType paymentMethodType, String externalId);
}
