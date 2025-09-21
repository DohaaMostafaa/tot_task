import 'package:tot_task/features/home/data/models/product_model.dart';
import '../../../../core/networking/api_result.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<ProductModel>>> getAllProducts();

}