import 'package:digiflay_task/core/helper/spacing.dart';

import 'package:digiflay_task/features/home/presentation/component/app_bar_component.dart';
import 'package:digiflay_task/features/home/presentation/component/banner_component.dart';
import 'package:digiflay_task/features/home/presentation/component/best_seller_and_view_all_component.dart';
import 'package:digiflay_task/features/home/presentation/component/product_list_view_component.dart';
import 'package:digiflay_task/features/home/presentation/component/search_component.dart';
import 'package:flutter/material.dart';


class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(15),

              // Name & image & notification & heart Icons
              const AppBarComponent(),

              verticalSpace(12),

              const SearchComponent(),

              verticalSpace(20),

              const BannerComponent(),

              verticalSpace(40),

              const BestSellerAndViewAllComponent(),

              verticalSpace(20),

              const ProductListViewComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

