import 'package:flipkart_clone/model/home_model.dart';
import 'package:flutter/material.dart';

class SugguestProductWidget extends StatelessWidget {
  final List<ProductModel> sugguestProduct;

  const SugguestProductWidget({super.key, required this.sugguestProduct});

  @override
  Widget build(BuildContext context) {
    if (sugguestProduct.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final List<String> earbudImages = [
      'https://micompra.com.co/cdn/shop/files/Recurso112_16ef7c6f-54ce-49d1-83af-7f5bc251e45f_800x.png?v=1756350186',
      'https://p.globalsources.com/IMAGES/PDT/B5962328315/TWS-Earbuds-TWS-Earphone.jpg',
    ];

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: sugguestProduct.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.70,
        ),
        itemBuilder: (context, index) {
          final product = sugguestProduct[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  earbudImages[index],
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
                      product.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
