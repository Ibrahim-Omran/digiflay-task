import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/features/home/presentation/component/product_component.dart';
import 'package:digiflay_task/features/home/presentation/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListViewComponent extends StatelessWidget {
  const ProductListViewComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = MediaQuery.of(context).size.width;
        return SizedBox(
          height: width < 500 ? 272.h : 400,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<HomeCubit>(context);
              return state is ProductsLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.products.length,
                      itemBuilder: (context, index) {
                        return ProductComponent(
                          width: width,
                          imageProduct: cubit.products[index].category.image,
                          nameProduct: cubit.products[index].title,
                          subTitleProduct: cubit.products[index].description,
                          priceProduct: cubit.products[index].price.toString(),
                          discountProduct: '-17',
                        );
                      },
                    );
            },
          ),
        );
      },
    );
  }
}
