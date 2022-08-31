import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/subscription_mapper.dart';
import 'package:speakyfox/data/remote/subscription_client.dart';
import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository<Subscription> {
  final ConnectivityService _connectivityService;
  final SubscriptionClient _subscriptionClient;

  SubscriptionRepositoryImpl(this._connectivityService, this._subscriptionClient);

  @override
  Future<Subscription> createSubscription(String userId, SubscriptionCreateRequest subscription) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _subscriptionClient.createSubscription(userId, {"subscription": subscription.toJson()});
        return response.data.toSubscription();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "SubscriptionRepositoryImpl.createSubscription()");
  }

  @override
  Future<bool> cancel(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _subscriptionClient.cancel(id);
        bool success = response.data;
        return success;
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "SubscriptionRepositoryImpl.cancel()");
  }

  @override
  Future<List<Subscription>> getAll(String param) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Subscription> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Subscription> patchById(String id, Subscription entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }

  @override
  Future<Subscription> post(Subscription entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }
}
