import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/data/local/user_local_source.dart';
import 'package:speakyfox/data/mappers/order_mapper.dart';
import 'package:speakyfox/data/mappers/subscription_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote/user_client.dart';
import 'package:speakyfox/data/requests/change_password_request.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/order.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository, BaseRepository<User> {
  final ConnectivityService _connectivityService;
  final UserClient _userClient;
  final UserLocalSource _userLocalSource;

  UserRepositoryImpl(this._connectivityService, this._userClient, this._userLocalSource);

  @override
  Future<String> attachPaymentMethodToUser(PaymentMethodType type, String externalPaymentMethodId) {
    // TODO: implement attachPaymentMethodToUser

    //We don't use this, says Julien (31.Aug 2022)
    throw UnimplementedError();
  }

  @override
  Future<bool> changePassword(ChangePasswordRequest request) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.changePassword(request.toMap());
        bool success = response.data;
        return success;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.changePassword()");
  }

  @override
  Future<String> createSetupIntent(String userId, PaymentMethodType paymentMethodType) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.createSetupIntent(userId, {"paymentMethodType": paymentMethodType.name});
        return response.data;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.createSetupIntent()");
  }

  @override
  Future<User> createUser(CreateProfileUserRequest createProfileUserRequest) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.createUser(createProfileUserRequest.toJson());
        return response.data.toUser();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.createUser()");
  }

  @override
  Future<List<User>> getAll(String param) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.getAll("");
        return response.data.map((e) => e.toUser()).toList();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.getAll()");
  }

  @override
  Future<User> getById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.getById(id);
        return response.data.toUser();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.getById()");
  }

  @override
  Future<Order> getOrdersOfCurrentUser(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.getOrdersOfCurrentUser(id);
        return response.data.toOrder();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.getOrdersOfCurrentUser()");
  }

  @override
  Future<List<Subscription>> getSubscriptions(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.getSubscriptions(id);
        List<Subscription> subscriptions = response.data.map((e) => e.toSubscription()).toList();
        return subscriptions;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.getSubscriptions()");
  }

  @override
  Future<User> patchById(String id, User entity) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.patchById(id, entity);
        return response.data.toUser();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.patchById()");
  }

  @override
  Future<LanguagePair> patchLanguagePairBySourceTargetLanguagesIds(String sourceLanguageId, String targetLanguageId) {
    // TODO: implement patchLanguagePairBySourceTargetLanguagesIds
    throw UnimplementedError();
  }

  @override
  Future<User> post(User entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }

  @override
  Future<bool> removePaymentMethod(String id, PaymentMethodType paymentMethodType, String externalId) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.removePaymentMethod(id, paymentMethodType.name, externalId);
        bool success = response.data;
        return success;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }
    throw UIException(message: "UserRepositoryImpl.removePaymentMethod()");
  }

    @override
  Future<Subscription> createSubscription(String userId, SubscriptionCreateRequest subscription) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _userClient.createSubscription(userId, {"subscription": subscription.toJson()});
        return response.data.toSubscription();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "SubscriptionRepositoryImpl.createSubscription()");
  }
}
