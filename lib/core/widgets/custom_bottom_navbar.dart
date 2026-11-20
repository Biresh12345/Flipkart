import 'package:flipkart_clone/controllers/home_controller.dart';
import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flipkart_clone/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavbar extends StatelessWidget {
  final List<BottomNavModel> navData;
  final HomeController controller;
  const CustomBottomNavbar({
    super.key,
    required this.navData,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final List<IconData> selectedIcons = [
      Icons.home,
      Icons.play_arrow,
      Icons.category,
      Icons.person,
      Icons.shopping_cart,
    ];

    final List<IconData> unselectedIcons = [
      Icons.home_outlined,
      Icons.play_arrow_outlined,
      Icons.category_outlined,
      Icons.person_outline,
      Icons.shopping_cart_outlined,
    ];

    return Obx(() {
      return Container(
        margin: EdgeInsets.only(bottom: 8.h, top: 8.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: navData.asMap().entries.map((nav) {
            final index = nav.key;
            final navDetails = nav.value;
            final selectedindex = controller.selectedMenu.value == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.changeMenu(index);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                  decoration: BoxDecoration(
                    color: selectedindex
                        ? Colors.grey.withValues(alpha: 0.3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        selectedindex
                            ? selectedIcons[index]
                            : unselectedIcons[index],
                        size: 26.w,
                        color: selectedindex ? AppColors.primary : Colors.black,
                      ),
                      Text(
                        navDetails.label,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: selectedindex ? 11.sp : 8.sp,
                          fontWeight: selectedindex
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: selectedindex
                              ? AppColors.primary
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
