
import 'package:tot_task/features/home/data/models/product_model.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}
class HomeLoading extends HomeStates {}
class HomeCategoriesLoaded extends HomeStates {
  final List<String> categories;
  HomeCategoriesLoaded(this.categories);
}
class HomeProductsLoaded extends HomeStates {
  final List<ProductModel> products;
  HomeProductsLoaded(this.products);
}
class NetworkError extends HomeStates{}
class HomeError extends HomeStates {
  final String message;
  HomeError(this.message);
}
