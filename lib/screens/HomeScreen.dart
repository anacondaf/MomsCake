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
                  Text(
                    "Wow Cakes",
                    style: AppStyles.h2,
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
                          Text("Choose something sweet?", style: AppStyles.b2),
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
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 150,
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
