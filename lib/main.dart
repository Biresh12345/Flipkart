import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flipkart_clone/core/routes/app_routes.dart';
import 'package:flipkart_clone/screen/account/acoount_screen.dart';
import 'package:flipkart_clone/screen/cart/cart_screen.dart';
import 'package:flipkart_clone/screen/category/category_screen.dart';
import 'package:flipkart_clone/screen/home/home_screen.dart';
import 'package:flipkart_clone/screen/minutes/minute_screen.dart';
import 'package:flipkart_clone/screen/play/play_screen.dart';
import 'package:flipkart_clone/screen/splash/splash_screen.dart';
import 'package:flipkart_clone/screen/travel/travel_screen.dart';
import 'package:flipkart_clone/screen/value365/value365_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flipkart',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.primary,
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: AppRoutes.splash,
          getPages: [
            GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
            GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
            GetPage(name: AppRoutes.play, page: () => const PlayScreen()),
            GetPage(
              name: AppRoutes.category,
              page: () => const CategoryScreen(),
            ),
            GetPage(name: AppRoutes.account, page: () => const AcoountScreen()),
            GetPage(name: AppRoutes.minute, page: () => const MinuteScreen()),
            GetPage(name: AppRoutes.travel, page: () => const TravelScreen()),
            GetPage(
              name: AppRoutes.value365,
              page: () => const Value365Screen(),
            ),
          ],
        );
      },
    );
  }
}
