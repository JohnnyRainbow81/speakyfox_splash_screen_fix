import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/offer_mapper.dart';
import 'package:speakyfox/data/mappers/order_mapper.dart';
import 'package:speakyfox/data/remote/order_client.dart';
import 'package:speakyfox/data/requests/create_order_request.dart';
import 'package:speakyfox/domain/models/order.dart';
import 'package:speakyfox/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository<Order> {
  final ConnectivityService _connectivityService;
  final OrderClient _orderClient;

  OrderRepositoryImpl(this._connectivityService, this._orderClient);

  @override
  Future<Order> createOrder(String userId, CreateOrderRequest orderRequest) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _orderClient.createOrder(userId, orderRequest.toMap());
        return response.data.toOrder();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "OrderRepositoryImpl.createOrder()");
  }
}
