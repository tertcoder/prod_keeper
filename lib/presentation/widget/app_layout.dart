import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/presentation/pages/products_list_screen.dart';
import 'package:prod_keeper/presentation/pages/products_manage_screen.dart';
import 'package:prod_keeper/prod_keeper_icon_icons.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  // final List<Widget> _pages = [
  //   const ProductsListScreen(),
  //   const ProductsManageScreen()
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          ProductsListScreen(),
          ProductsManageScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: ColorPallette.whiteColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: GNav(
              iconSize: 24,
              padding: const EdgeInsets.all(12),
              tabBackgroundColor: ColorPallette.primaryColor.withOpacity(0.1),
              activeColor: ColorPallette.primaryColor,
              mainAxisAlignment: MainAxisAlignment.center,
              gap: 12,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    _selectedIndex = index;
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                );
              },
              tabs: const [
                GButton(
                  text: "Explore",
                  gap: 4,
                  icon: ProdKeeperIcon.explore,
                ),
                GButton(
                  text: "Manage",
                  gap: 4,
                  icon: ProdKeeperIcon.manage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
