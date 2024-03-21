import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:moms_cake/app_styles.dart';

import '../components/CakeCategoryCard.dart';
import '../components/CakeIndividualCard.dart';
import '../components/SearchWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const cakeCategoryList = <String>[
      'Popular',
      'Croissant',
      'Mousse',
      'Tiramisu',
      'Panna cotta'
    ];

    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          Container(
            color: Colors.white.withOpacity(0.7),
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Wow Cakes",
                            style: AppStyles.h2,
                          ),
                        ),
                        const Gap(18.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, Tina",
                                  style: AppStyles.b3,
                                ),
                                const Gap(3.0),
                                Text("Choose something sweet?",
                                    style: AppStyles.b2),
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.bell,
                              size: 22,
                            ),
                          ],
                        ),
                        const Gap(24.0),
                      ],
                    ),
                  ),
                ),
                const SearchWidget(), // Search widget
              ],
            ),
          ),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 130,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cakeCategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CakeCategoryCard(
                    cakeType: cakeCategoryList[index],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Popular",
              style: AppStyles.h3,
            ),
          ),
          const Gap(12),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                childAspectRatio: (180 / 245),
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  10,
                  (index) {
                    return CakeIndividualCard(
                      imagePath: 'assets/svg/category_mousse.jpg',
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class HomeScreenClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var h = size.height;
//     var w = size.width;
//
//     return Path()
//       ..lineTo(0, h)
//       // ..quadraticBezierTo(w / 5, h, w * 0.5, h - 25)
//       // ..quadraticBezierTo(w * 0.75, h - 50, w, h - 10)
//       ..lineTo(w, h)
//       ..lineTo(w, 0)
//       ..close();
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
