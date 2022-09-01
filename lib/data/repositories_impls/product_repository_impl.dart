import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/mappers/subscription_mapper.dart';
import 'package:speakyfox/data/remote/product_client.dart';
import 'package:speakyfox/domain/models/product.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository<Product, Subscription>, BaseRepository<Product> {
  ConnectivityService _connectivityService;
  ProductClient _productClient;

  ProductRepositoryImpl(this._connectivityService, this._productClient);


  @override
  Future<Subscription> getSubscriptionById(String id) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _productClient.getSubscriptionById(id);
        return response.data.toSubscription();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "ProductRepositoryImpl.getSubscriptionById()");
  }
  
  @override
  Future<List<Product>> getAll(String param) {
    // TODO: implement getAll
    throw UnimplementedError();
  }
  
  @override
  Future<Product> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Product> patchById(String id, Product entity) {
    // TODO: implement patchById
    throw UnimplementedError();
  }
  
  @override
  Future<Product> post(Product entity) {
    // TODO: implement post
    throw UnimplementedError();
  }
  
  @override
  Future<bool> removeById(String id) {
    // TODO: implement removeById
    throw UnimplementedError();
  }

}
