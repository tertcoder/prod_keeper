import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      title: Text(title),
      floating: true,
      pinned: true,
      backgroundColor: ,
    );
  }
}
