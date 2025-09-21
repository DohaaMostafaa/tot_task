import 'package:go_router/go_router.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import 'route_names.dart';
import '../../features/home/presentation/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cart',
      name: RouteNames.cart,
      builder: (context, state) => const CartScreen(),
    ),
  ],
);
