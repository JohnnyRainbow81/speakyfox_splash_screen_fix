import 'package:speakyfox/data/repositories_impls/product_repository_impl.dart';
import 'package:speakyfox/domain/models/product.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/product_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class ProductService extends BaseService<Product> {
  late final ProductRepository<Product, Subscription> _productRepository;

  ProductService(ProductRepositoryImpl productRepositoryImpl) : super(productRepositoryImpl) {
    _productRepository = productRepositoryImpl;
  }

  Future<Subscription> getSubscriptionById(String id) async {
    return await _productRepository.getSubscriptionById(id);
  }
}
