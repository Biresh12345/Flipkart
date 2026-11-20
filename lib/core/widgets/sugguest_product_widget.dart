import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flipkart_clone/core/widgets/custom_cache_image.dart';
import 'package:flipkart_clone/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SugguestProductWidget extends StatelessWidget {
  final List<ProductModel> sugguestProduct;

  const SugguestProductWidget({super.key, required this.sugguestProduct});

  @override
  Widget build(BuildContext context) {
    if (sugguestProduct.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final List<String> earbudImages = [
      'https://micompra.com.co/cdn/shop/files/Recurso112_16ef7c6f-54ce-49d1-83af-7f5bc251e45f_800x.png?v=1756350186',
      'https://p.globalsources.com/IMAGES/PDT/B5962328315/TWS-Earbuds-TWS-Earphone.jpg',
    ];

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: sugguestProduct.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.70,
        ),
        itemBuilder: (context, index) {
          final product = sugguestProduct[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: AppColors.textSecondary.withValues(alpha: 0.1),
                  child: Stack(
                    children: [
                      CustomCacheImage(
                        imageUrl: earbudImages[index],
                        borderRadius: 24,
                        fit: BoxFit.contain,
                        height: double.infinity.h,
                        width: double.infinity.w,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.h,
                              vertical: 2.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product.rating.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "₹ ${product.mrp.toString()}",
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "₹ ${product.price.toString()}",
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Discount is ${product.discountPercent.toString()}% ,Hurry up",
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
