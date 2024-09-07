import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prod_keeper/presentation/pages/products_list_screen.dart';
import 'package:prod_keeper/presentation/widget/app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prod Keeper',
      theme: ThemeData(textTheme: GoogleFonts.firaSansTextTheme()),
      home: const AppLayout(),
    );
  }
}
