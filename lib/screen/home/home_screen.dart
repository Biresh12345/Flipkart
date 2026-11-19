import 'dart:async';

import 'package:flipkart_clone/controllers/home_controller.dart';
import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flipkart_clone/core/constant/app_string.dart';
import 'package:flipkart_clone/core/widgets/banner_widget.dart';
import 'package:flipkart_clone/core/widgets/custom_bottom_navbar.dart';
import 'package:flipkart_clone/core/widgets/custom_category_tabs.dart';
import 'package:flipkart_clone/core/widgets/custom_search_bar.dart';
import 'package:flipkart_clone/core/widgets/ad_product_widget.dart';
import 'package:flipkart_clone/core/widgets/sugguest_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.find<HomeController>();
  final TextEditingController searchBar = TextEditingController();

  Timer? timer;

  final List<String> serviceTabImages = [
    'assets/icons/f.png',
    'assets/icons/12.png',
    'assets/icons/airplane.png',
    'assets/icons/offer.png',
  ];

  final List<String> searchList = [
    "Shoes",
    "Mobile",
    "Laptop",
    "Facewash",
    "Cold Drink",
  ];

  int index = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted || searchList.isEmpty) return;
      setState(() {
        index = (index + 1) % searchList.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    searchBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = controller.homemodel.value?.data;
        if (data == null) {
          return const Center(child: Text("data is not available"));
        }

        final serviceTab = data.serviceTabs;
        final address = data.deliveryAddress;
        final addProduct = data.adProducts;
        final sugguestProduct = data.suggestedForYou;
        final category = data.categories;

        return Container(
          color: Colors.red,
          child: SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: screenHeight - topPadding),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.3, 1.0],
                  colors: [Colors.red, Colors.white, Colors.white],
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 90.h),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/golden_diamond.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 8.h),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Row(
                            children: List.generate(serviceTab.length, (index) {
                              final tabDetails = serviceTab[index];
                              final i = index < serviceTabImages.length
                                  ? index
                                  : 0;

                              return Container(
                                margin: EdgeInsets.only(right: 12.w),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.background.withValues(
                                    alpha: 0.8,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      tabDetails.iconUrl ?? '',
                                      width: 30.w,
                                      height: 30.w,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stack) =>
                                          Image.asset(
                                            serviceTabImages[i],
                                            width: 25.w,
                                            height: 25.w,
                                          ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      tabDetails.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 8.h),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white.withValues(
                                      alpha: 0.3,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.home, size: 24.w),
                                      SizedBox(width: 5.w),
                                      Expanded(
                                        child: Text(
                                          address,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down, size: 24.w),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.white.withValues(alpha: 0.3),
                                ),
                                child: Image.asset(
                                  'assets/icons/ticket.png',
                                  width: 28.w,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.white.withValues(alpha: 0.3),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/icons/token.png',
                                      width: 28.w,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black.withValues(
                                          alpha: 0.6,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Stack(
                                    children: [
                                      CustomSearchBar(
                                        controller: searchBar,
                                        fillColor: AppColors.white,
                                        prefixIcon: Icons.search,
                                        suffixIcon: Icons.mic,
                                        filled: true,
                                      ),
                                      if (searchBar.text.isEmpty)
                                        Positioned.fill(
                                          left: 60.w,
                                          child: IgnorePointer(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AnimatedSwitcher(
                                                duration: const Duration(
                                                  milliseconds: 500,
                                                ),
                                                switchInCurve: Curves.ease,
                                                switchOutCurve: Curves.easeIn,
                                                child: Text(
                                                  'Search ${searchList[index]}',
                                                  key: ValueKey(
                                                    searchList[index],
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/icons/qr-code.png',
                                width: 35.w,
                              ),
                            ],
                          ),
                        ),

                        CustomCategoryTabs(
                          category: category,
                          controller: controller,
                        ),
                        const Divider(),
                        const BannerWidget(),
                        ProductWidget(adProduct: addProduct),

                        Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  AppStrings.suggestionAll,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.textPrimary,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    size: 24.w,
                                    color: AppColors.background,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SugguestProductWidget(sugguestProduct: sugguestProduct),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        final navbarData = controller.homemodel.value?.data.bottomNav ?? [];

        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomBottomNavbar(
                    navData: navbarData,
                    controller: controller,
                  ),
                ),
                SizedBox(width: 10.w),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Icon(Icons.auto_awesome, size: 24.w),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
