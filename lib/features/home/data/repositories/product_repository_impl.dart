import 'package:dio/dio.dart';
import 'package:tot_task/features/home/data/models/product_model.dart';
import 'package:tot_task/features/home/domain/repositories/products.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../../core/networking/network_exceptions.dart';

class ProductRepoImpl implements ProductsRepository {
  Dio dio;
  ApiServices apiServices;

  ProductRepoImpl(this.dio, this.apiServices);

  @override
  Future<ApiResult<List<ProductModel>>> getAllProducts() async {
    try {
      var response = await apiServices.getProducts();
      return Success(response);
    } catch (error) {
      return Failure(NetworkExceptions.getDioException(error));
    }
  }
}