import 'package:flipkart_clone/controllers/home_controller.dart';
import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flipkart_clone/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCategoryTabs extends StatelessWidget {
  final List<CategoryModel> category;
  final HomeController controller;

  const CustomCategoryTabs({
    super.key,
    required this.category,
    required this.controller,
  });

  final List<IconData> icons = const [
    Icons.shopping_bag_outlined,
    Icons.checkroom_outlined,
    Icons.mobile_friendly_outlined,
    Icons.laptop_outlined,
    Icons.spa_outlined,
    Icons.light_outlined,
    Icons.kitchen_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedCategoryIndex.value == index;

            return GestureDetector(
              onTap: () {
                controller.selectedCategory(index);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.w, left: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index % icons.length],
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    Text(
                      category[index].name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
