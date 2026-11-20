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

  final List<IconData> selectedIcons = const [
    Icons.shopping_bag,
    Icons.checkroom,
    Icons.mobile_friendly,
    Icons.laptop,
    Icons.spa,
    Icons.lightbulb,
    Icons.kitchen,
  ];

  final List<IconData> unselectedIcons = const [
    Icons.shopping_bag_outlined,
    Icons.checkroom_outlined,
    Icons.mobile_friendly_outlined,
    Icons.laptop_outlined,
    Icons.spa_outlined,
    Icons.lightbulb_outline,
    Icons.kitchen_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedCategoryIndex.value == index;

            return GestureDetector(
              onTap: () => controller.selectedCategory(index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blueGrey.withValues(alpha: 0.3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isSelected
                            ? selectedIcons[index % selectedIcons.length]
                            : unselectedIcons[index % unselectedIcons.length],
                        size: 23.w,
                        color: isSelected ? AppColors.primary : Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      category[index].name,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Container(
                      height: 4.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5.r),
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
