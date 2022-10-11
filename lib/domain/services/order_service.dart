import 'package:speakyfox/data/requests/create_order_request.dart';
import 'package:speakyfox/domain/models/order.dart';
import 'package:speakyfox/domain/repositories/order_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

class OrderService {
  final AuthenticationService _authenticationService;
  final OrderRepository<Order> _orderRepository;

  OrderService(this._authenticationService, this._orderRepository);

  Future<Order> createOrder(CreateOrderRequest orderRequest)async {
    String userId = (_authenticationService.getCredentials())!.user.id;
    return _orderRepository.createOrder(userId, orderRequest);
  }
}
