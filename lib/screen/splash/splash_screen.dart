import 'package:flipkart_clone/controllers/home_controller.dart';
import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flipkart_clone/core/constant/app_string.dart';
import 'package:flipkart_clone/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final HomeController controller;
  late final AnimationController _animController;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  final RxBool isLoading = true.obs;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomeController());

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fade = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _scale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOutCubic),
    );
    _animController.forward();

    checkApi();
  }

  Future<void> checkApi() async {
    if (_isFetching) return;
    _isFetching = true;

    isLoading.value = true;
    controller.errorMessage.value = '';

    try {
      await Future.wait([
        controller.fetchHomeData(),
        Future.delayed(const Duration(seconds: 2)),
      ]);

      if (!mounted) return;

      if (controller.homemodel.value != null) {
        Get.offNamed(AppRoutes.home);
        return;
      }

      if (controller.errorMessage.isEmpty) {
        controller.errorMessage.value = 'Something went wrong';
      }
    } catch (e) {
      debugPrint('Splash API Error: $e');
      if (controller.errorMessage.isEmpty) {
        controller.errorMessage.value = 'Something went wrong';
      }
    } finally {
      _isFetching = false;
      if (mounted) isLoading.value = false;
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
            FadeTransition(
              opacity: _fade,
              child: ScaleTransition(
                scale: _scale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/icons/splashlogo.png', width: 90),
                    const SizedBox(height: 12),
                    Text(
                      AppStrings.appName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
            SizedBox(
              height: 90,
              child: Obx(() {
                if (isLoading.value) {
                  return const Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    ),
                  );
                }

                if (controller.errorMessage.isNotEmpty) {
                  return Column(
                    children: [
                      const Text(
                        'Unable to load. Check your connection.',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: checkApi,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                        ),
                        child: const Text('Try Again'),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              }),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
