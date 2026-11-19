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
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        itemCount: adProduct.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          final product = adProduct[index];

          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      beautyImages[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          product.ctaText ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                right: 8,
                top: 8,
                child: Chip(
                  label: Text('AD'),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
