import 'package:flipkart_clone/core/constant/app_color.dart' show AppColors;
import 'package:flipkart_clone/core/widgets/custom_cache_image.dart';
import 'package:flipkart_clone/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  final List<ProductModel> adProduct;

  const ProductWidget({super.key, required this.adProduct});

  @override
  Widget build(BuildContext context) {
    if (adProduct.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final List<String> beautyImages = [
      'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=500',
      'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=500',
      'https://images.unsplash.com/photo-1601049541289-9b1b7bbbfe19?w=500',
    ];

    return SizedBox(
      height: 170.h,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        itemCount: adProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: 120.w,
          mainAxisSpacing: 8.w,
        ),
        itemBuilder: (context, index) {
          final product = adProduct[index];

          return Center(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: CustomCacheImage(
                            imageUrl: beautyImages[index % beautyImages.length],
                            fit: BoxFit.cover,
                            height: double.infinity.h,
                            width: double.infinity.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.ctaText ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 10.sp),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      color: Colors.black54,
                      child: Text(
                        'AD',
                        style: TextStyle(color: Colors.white, fontSize: 9.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
