import 'package:speakyfox/domain/models/product.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/product_repository.dart';

class ProductService implements ProductRepository<Product, Subscription> {
  final ProductRepository<Product, Subscription> _productRepository;

  ProductService(this._productRepository);

  @override
  Future<Subscription> getSubscriptionById(String id) async {
    return await _productRepository.getSubscriptionById(id);
  }

  @override
  Future<List<Product>> getAll(String param) async {
    return await _productRepository.getAll(param);
  }

  @override
  Future<Product> getById(String id) async {
    return await _productRepository.getById(id);
  }

  @override
  Future<Product> patchById(String id, Product entity) async {
    return await _productRepository.patchById(id, entity);
  }

  @override
  Future<Product> post(Product entity) async {
    return await _productRepository.post(entity);
  }

  @override
  Future<bool> removeById(String id) async {
    return await _productRepository.removeById(id);
  }
}
