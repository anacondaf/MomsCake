import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:iconsax/iconsax.dart";
import "package:moms_cake/screens/HomeScreen.dart";
import "package:moms_cake/screens/SecondScreen.dart";

import "app_styles.dart";

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SecondScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      extendBody: true,
      floatingActionButton: const FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.home,
                        color: _currentIndex == 0 ? AppStyles.orange : AppStyles.black,
                        size: 28,
                      ),
                    ),
                  ),
                  const Gap(10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.shopping_cart,
                        color: _currentIndex == 1 ? AppStyles.orange : AppStyles.black,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.wallet_3,
                        color: _currentIndex == 2 ? AppStyles.orange : AppStyles.black,
                        size: 28,
                      ),
                    ),
                  ),
                  const Gap(10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.user,
                        color: _currentIndex == 3 ? AppStyles.orange : AppStyles.black,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 58,
        height: 58,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [
                Color(0xFFed0c89),
                Color(0xFFfd6768),
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomRight,
              tileMode: TileMode.repeated),
        ),
        child: const Icon(
          Iconsax.heart,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
