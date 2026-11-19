import 'package:flipkart_clone/controllers/home_controller.dart';
import 'package:flipkart_clone/core/constant/app_string.dart';
import 'package:flipkart_clone/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomeController());
    checkApi();
  }

  Future<void> checkApi() async {
    await Future.wait([
      controller.fetchHomeData(),
      Future.delayed(const Duration(seconds: 2)),
    ]);

    if (controller.homemodel.value != null) {
      Get.offNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Column(
              children: [
                Image.asset('assets/icons/splashlogo.png', width: 80),
                Text(AppStrings.appName, style: TextStyle(color: Colors.white)),
              ],
            ),
            Obx(() {
              if (controller.errorMessage.isNotEmpty) {
                return TextButton(
                  onPressed: checkApi,
                  child: const Text(
                    'Please Try Again',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              );
            }),
          ],
        ),
      ),
    );
  }
}
