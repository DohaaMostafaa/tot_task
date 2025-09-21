import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_task/features/home/presentation/cubit/home_cubit/states.dart';
import '../../../../../core/networking/network_exceptions.dart';
import '../../../data/models/product_model.dart';
import '../../../domain/usecases/categories_usecases.dart';
import '../../../domain/usecases/products_usecases.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllCategories getCategories;
  final GetAllProducts getProducts;

  HomeCubit(this.getCategories, this.getProducts) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> categories = [];
  List<ProductModel> products = [];

  void init() async {
    await getAllCategories();
    await getAllProducts();
  }

  Future<void> getAllCategories() async {
    emit(HomeLoading());

    final result = await getCategories();

    result.when(
        success: (data) {
          categories = data;
          emit(HomeCategoriesLoaded(data));
        },
        failure: (error) {
          if (error is NoInternetConnection) {
            emit(NetworkError());
          } else {
            emit(HomeError(error.toString()));
          }
        }
    );
  }

  Future<void> getAllProducts() async {
    emit(HomeLoading());

    final result = await getProducts();

    result.when(
        success: (data) {
          products = data;
          emit(HomeProductsLoaded(data));
        },
        failure: (error) {
          if (error is NoInternetConnection) {
            emit(NetworkError());
          } else {
            emit(HomeError(error.toString()));
          }
        }
    );
  }


}
