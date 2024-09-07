import 'package:flutter/material.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/presentation/widget/my_app_bar.dart';
import 'package:prod_keeper/presentation/widget/product_card.dart';

class Product {
  final String title;
  final String price;
  final bool isDeleted;
  Product({
    required this.title,
    required this.price,
    required this.isDeleted,
  });
}

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
      Product(title: "T-shirt", price: "45,000 BIF", isDeleted: false),
    ];
    return Scaffold(
      backgroundColor: ColorPallette.backgroundColor,
      body: CustomScrollView(
        slivers: [
          const MyAppBar(title: "Products"),
          SliverList.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ProductCard(
              title: products[index].title,
            ),
          ),
        ],
      ),
    );
  }
}
