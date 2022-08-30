import 'package:speakyfox/data/requests/create_order_request.dart';

abstract class OrderRepository<T> {
  Future<T> createOrder(String userId, CreateOrderRequest orderRequest);
}
