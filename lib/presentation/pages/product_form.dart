import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/presentation/widget/text_input.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorPallette.whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 145,
                    height: 125,
                    decoration: BoxDecoration(
                      color: ColorPallette.textColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/img.svg"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      children: [
                        TextInput(
                          hintText: "Product name",
                        ),
                        SizedBox(height: 10),
                        TextInput(
                          hintText: "Price",
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorPallette.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Add the Product",
                      style: GoogleFonts.firaSans().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorPallette.backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
