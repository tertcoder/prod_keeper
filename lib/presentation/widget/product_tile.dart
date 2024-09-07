import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

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
                  child: Image.asset(
                    "assets/images/T-shirt.png",
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
                      "T-shirt",
                      style: GoogleFonts.firaSans().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorPallette.textColor,
                      ),
                    ),
                    Text(
                      "45,000.00 BIF",
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
                onTap: () {},
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
                  onTap: () {},
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
