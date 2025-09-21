import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/cart/data/local/local_db.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/domain/usecases/cart_usecases.dart';
import '../../features/home/data/repositories/product_repository_impl.dart';
import '../../features/home/domain/usecases/products_usecases.dart';
import '../../features/home/data/repositories/category_repository_impl.dart';
import '../../features/home/domain/repositories/categories.dart';
import '../../features/home/domain/repositories/products.dart';
import '../../features/home/domain/usecases/categories_usecases.dart';
import '../networking/api_constants.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(sl<LocalDatabase>()),
  );

  sl.registerLazySingleton(() => GetAllCartItems(sl()));
  sl.registerLazySingleton(() => AddCartItem(sl()));
  sl.registerLazySingleton(() => UpdateCartItem(sl()));
  sl.registerLazySingleton(() => DeleteCartItem(sl()));
  sl.registerLazySingleton(() => ClearCart(sl()));

  sl.registerLazySingleton<Dio>(() => DioFactory.createDio());

  sl.registerLazySingleton<ApiServices>(
        () => ApiServices(sl<Dio>(), baseUrl: ApiConstants.apiBaseUrl),
  );

  sl.registerLazySingleton<ProductsRepository>(
        () => ProductRepoImpl(sl<Dio>(), sl<ApiServices>()),
  );
  sl.registerLazySingleton<GetAllProducts>(
        () => GetAllProducts(sl<ProductsRepository>()),
  );

  sl.registerLazySingleton<CategoriesRepository>(
        () => CategoriesRepoImpl(sl<Dio>(), sl<ApiServices>()),
  );
  sl.registerLazySingleton<GetAllCategories>(
        () => GetAllCategories(sl<CategoriesRepository>()),
  );
}
