import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../cart_cubit/cubit.dart';

class CouponField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final CartCubit cubit;

  const CouponField({super.key, required this.formKey, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: cubit.discountController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a coupon code";
          } else if (value != "SAVE10" && value != "WELCOME20") {
            return "Invalid coupon code";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Coupon Code",
          hintText: "e.g. SAVE10, WELCOME20, FREESHIP",
          suffixIcon: IconButton(
            icon: cubit.isAppliedDiscount
                ? const Icon(Icons.close, color: AppColors.primary)
                : const Icon(Icons.check, color: AppColors.primary),
            onPressed: () {
              if (!cubit.isAppliedDiscount &&
                  formKey.currentState!.validate()) {
                cubit.applyDiscount(cubit.discountController.text.trim());
              } else if (cubit.isAppliedDiscount) {
                cubit.removeDiscount();
              }
            },
          ),
        ),
      ),
    );
  }
}
