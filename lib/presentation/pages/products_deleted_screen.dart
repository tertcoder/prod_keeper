import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/presentation/blocs/bloc/product_bloc.dart';
import 'package:prod_keeper/presentation/widget/my_app_bar.dart';
import 'package:prod_keeper/presentation/widget/product_card.dart';

class ProductsDeletedScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ProductsDeletedScreen(),
      );
  const ProductsDeletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorPallette.backgroundColor,
      body: CustomScrollView(
        slivers: [
          const MyAppBar(title: "Deleted"),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is ProductLoaded) {
                final products =
                    state.products.where((p) => p.isDeleted).toList();

                if (products.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No Products deleted yet.',
                        style: GoogleFonts.firaSans().copyWith(
                          color: ColorPallette.textColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx, int idx) {
                        final product = products[idx];
                        return ProductCard(product: product);
                      },
                      childCount: products.length,
                    ),
                  ),
                );
              } else if (state is ProductError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "Failed to load deleted products. Please try again.",
                      style: GoogleFonts.firaSans(
                        color: ColorPallette.textColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return SliverFillRemaining(
                child: Text(
                  'No Products deleted yet.',
                  style: GoogleFonts.firaSans().copyWith(
                    color: ColorPallette.textColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
