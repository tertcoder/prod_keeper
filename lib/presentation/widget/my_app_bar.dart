import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      // actions: [
      //   GestureDetector(
      //     child: Container(
      //       padding: const EdgeInsets.all(16),
      //       decoration: BoxDecoration(
      //         color: ColorPallette.backgroundColor.withOpacity(0.05),
      //         shape: BoxShape.circle,
      //       ),
      //       child: SvgPicture.asset(
      //         "assets/icons/bin.svg",
      //         // color: ColorPallette.backgroundColor,
      //         colorFilter: const ColorFilter.mode(
      //           ColorPallette.backgroundColor,
      //           BlendMode.srcIn,
      //         ),
      //       ),
      //     ),
      //   )
      // ],
      backgroundColor: ColorPallette.primaryColor,
      expandedHeight: 188,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: GoogleFonts.firaSans().copyWith(
            color: ColorPallette.backgroundColor,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          bottom: 42,
        ),
        background: Image.asset(
          "assets/images/pattern_small.png",
          fit: BoxFit.cover,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 16,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorPallette.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
