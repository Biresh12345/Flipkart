import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(),
      body: Center(child: Text("Category page")),
    );
  }
}
