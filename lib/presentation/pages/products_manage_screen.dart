import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/presentation/blocs/bloc/product_bloc.dart';
import 'package:prod_keeper/presentation/widget/product_form.dart';
import 'package:prod_keeper/presentation/widget/my_app_bar.dart';
import 'package:prod_keeper/presentation/widget/product_tile.dart';

class ProductsManageScreen extends StatelessWidget {
  const ProductsManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallette.backgroundColor,
      body: CustomScrollView(
        slivers: [
          const MyAppBar(
            title: "Manage",
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _showAddProductForm(context),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorPallette.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add a new Product",
                            style: GoogleFonts.firaSans().copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ColorPallette.backgroundColor,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/add.svg",
                            width: 32,
                            height: 32,
                            colorFilter: const ColorFilter.mode(
                              ColorPallette.backgroundColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
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
                    state.products.where((p) => !p.isDeleted).toList();
                if (products.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No Products available.\nTap "Add a new Product" to create one.',
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
                        return ProductTile(product: product);
                      },
                      childCount: products.length,
                    ),
                  ),
                );
              } else if (state is ProductError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "Failed to load products. Please try again.",
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
                  'No Products available.\nTap "Add a new Product" to create one.',
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

void _showAddProductForm(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return BlocProvider.value(
        // create: (context) => ProductBloc(),
        value: BlocProvider.of<ProductBloc>(context),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: const Center(
              child: ProductForm(),
            ),
          ),
        ),
      );
    },
  );
}
