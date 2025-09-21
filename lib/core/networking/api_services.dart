import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tot_task/features/home/data/models/product_model.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  
  @GET(ApiConstants.categoriesEndpoint)
  Future<List<String>> getCategories();

 @GET(ApiConstants.productsEndpoint)
  Future<List<ProductModel>> getProducts();

}