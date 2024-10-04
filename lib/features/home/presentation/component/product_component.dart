import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({
    super.key,
    required this.imageProduct,
    required this.nameProduct,
    required this.priceProduct,
    required this.subTitleProduct,
    required this.discountProduct,
    required this.width,
  });

  final String imageProduct;
  final String nameProduct;
  final String priceProduct;
  final String subTitleProduct;
  final String discountProduct;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: Container(
          width: width < 500 ? 253.w : 300,
          height: width < 500 ? 272.h : 300,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width < 500 ? 237.w : 280,
                height: width < 500 ? 185.h : 270,
                margin: const EdgeInsets.all(8),
                color: AppColors.whiteProduct,
                child: Column(
                  children: [
                    // discount and Favorite Icon....
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: width < 500 ? 55.w : 70,
                              height: width < 500 ? 32.h : 50,
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  '$discountProduct%',
                                  style: TextStyle(
                                      fontSize: width < 500 ? 18 : 25,
                                      color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.favorite_border,
                            color: AppColors.primary,
                            size: width < 500 ? 28.sp : 40,
                          )
                        ],
                      ),
                    ),

                    // Image Product.....
                    Image.network(
                      imageProduct,
                      width: width < 500 ? 120.w : 180,
                      height: width < 500 ? 120.h : 180,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),

              // Name Product...
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    SizedBox(
                      width: width < 500 ? 200.w : 200,
                      child: Text(
                        nameProduct,
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14BlackBold
                            .copyWith(fontSize: width < 500 ? 14.sp : 30),
                      ),
                    ),
                  ],
                ),
              ),

              // SubTitle And Price Product...
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    SizedBox(
                      width: width < 500 ? 120.w : 120,
                      child: Text(
                        subTitleProduct,
                        textDirection: TextDirection.ltr,

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14GrayMedium
                            .copyWith(fontSize: width < 500 ? 14.sp : 25),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '$priceProduct L.E',
                      textDirection: TextDirection.ltr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14GreenBold
                          .copyWith(fontSize: width < 500 ? 14.sp : 25),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
