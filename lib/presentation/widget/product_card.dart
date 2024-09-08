import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/presentation/blocs/bloc/product_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          product.image
                  .startsWith("/data/user/0/com.prodkeeper.prod_keeper/cache/")
              ? Image.file(
                  File(product.image),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // height: double.infinity,
                )
              : Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // height: double.infinity,
                ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: ColorPallette.darkBlueColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title.length > 15
                        ? "${product.title.substring(0, 15)}..."
                        : product.title,
                    style: GoogleFonts.firaSans(
                      color: ColorPallette.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    product.price.toString().length > 9
                        ? "${product.price.toString().substring(0, 9)}... BIF"
                        : "${product.price} BIF",
                    style: GoogleFonts.firaSans(
                      color: ColorPallette.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                context.read<ProductBloc>().add(
                      DeleteExistingProduct(
                        product.copyWith(
                          isDeleted: true,
                        ),
                      ),
                    );
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: ColorPallette.errorColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/icons/bin.svg",
                  colorFilter: const ColorFilter.mode(
                    ColorPallette.backgroundColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
