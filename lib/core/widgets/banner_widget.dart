import 'dart:async';

import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController pageController = PageController();
  Timer? timer;
  int currentIndex = 0;

  final List<String> bannerImages = [
    'assets/banner/banner_1.webp',
    'assets/banner/banner_2.webp',
    'assets/banner/banner_3.webp',
    'assets/banner/banner_4.webp',
    'assets/banner/banner_1.webp',
    'assets/banner/banner_2.webp',
    'assets/banner/banner_3.webp',
    'assets/banner/banner_4.webp',
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (time) {
      if (!pageController.hasClients) return;

      currentIndex = (currentIndex + 1) % bannerImages.length;

      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: pageController,
            itemCount: bannerImages.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    bannerImages[index],
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bannerImages.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: currentIndex == index ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColors.darkBlue
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
