import 'package:speakyfox/domain/models/product.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/repositories/base_repository.dart';
import 'package:speakyfox/domain/repositories/product_repository.dart';
import 'package:speakyfox/domain/services/base_service.dart';

class ProductService extends BaseService<Product> {
  final ProductRepository<Product, Subscription> _productRepository;

  ProductService(BaseRepository<Product> baseRepository, this._productRepository) : super(baseRepository);

  Future<Subscription> getSubscriptionById(String id) async {
    return await _productRepository.getSubscriptionById(id);
  }

}
