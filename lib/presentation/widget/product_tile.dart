import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/presentation/blocs/bloc/product_bloc.dart';
import 'package:prod_keeper/presentation/widget/product_form.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: product.image.startsWith(
                          "/data/user/0/com.prodkeeper.prod_keeper/cache/")
                      ? Image.file(
                          File(product.image),
                          width: 120,
                          height: 68,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          product.image,
                          width: 120,
                          height: 68,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.title.length > 15
                          ? "${product.title.substring(0, 15)}..."
                          : product.title,
                      style: GoogleFonts.firaSans().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorPallette.textColor,
                      ),
                    ),
                    Text(
                      product.price.toString().length > 9
                          ? "${product.price.toString().substring(0, 9)}... BIF"
                          : "${product.price} BIF",
                      style: GoogleFonts.firaSans().copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColorPallette.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showUpdateProductForm(context, product);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorPallette.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SvgPicture.asset("assets/icons/edit.svg"),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorPallette.errorColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
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
                  child: SvgPicture.asset("assets/icons/bin.svg"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showUpdateProductForm(BuildContext context, Product product) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return BlocProvider.value(
        value: BlocProvider.of<ProductBloc>(context),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Center(
              child:
                  ProductForm(product: product), // Pass the product to the form
            ),
          ),
        ),
      );
    },
  );
}
