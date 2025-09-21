import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tot_task/core/helpers/spacing_helper.dart';
import 'package:tot_task/features/home/domain/usecases/products_usecases.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/theme_cubit/cubit.dart';
import '../../../../core/theme/theme_cubit/states.dart';
import '../../../../core/widgets/app_bar_actions.dart';
import '../../../../core/widgets/title_widget.dart';
import '../../domain/usecases/categories_usecases.dart';
import '../cubit/bottom_nav_cubit/cubit.dart';
import '../cubit/bottom_nav_cubit/states.dart';
import '../cubit/home_cubit/cubit.dart';
import '../widgets/app_name.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/home_banner.dart';
import '../widgets/location_bar.dart';
import '../widgets/flash_sale_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  HomeCubit(sl<GetAllCategories>(), sl<GetAllProducts>())
                    ..init()
        ),
        BlocProvider(create: (_) => BottomNavCubit()),
      ],
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                const BannerSlider(),
                verticalSpace(15.h),
                const TitleWidget(title: 'Categories'),
                verticalSpace(15.h),
                CategoriesGrid(),
                const TitleWidget(title: 'Flash Sale'),
                verticalSpace(15.h),
                FlashSaleSection(),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return CustomBottomBar(
            selectedIndex: state.currentIndex,
            onTap: (index) => context.read<BottomNavCubit>().updateIndex(index),
          );
        },
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    surfaceTintColor:Theme.of(context).appBarTheme.surfaceTintColor,
    title: ShimmerAppTitle(fontSize: 22.sp),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: const LocationBar(),
    ),
    actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
    actions: [
      BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final cubit = ThemeCubit.get(context);
          return AppBarAction(
            icon: cubit.currentMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
            onPressed: cubit.toggleTheme,
          );
        },
      ),
    ],
  );
}
