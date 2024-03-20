import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "../app_styles.dart";
import "../components/CakeIndividualCard.dart";

class CategoryViewScreen extends StatefulWidget {
  CategoryViewScreen({super.key, required this.cakeType});

  String cakeType;

  @override
  State<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends State<CategoryViewScreen> {
  List<String> imagePaths = [];

  @override
  void initState() {
    _initImages();
    super.initState();
  }

  Future _initImages() async {
    final AssetManifest assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final List<String> assets = assetManifest.listAssets();

    imagePaths = assets
        .where(
          (String key) {
            return key.contains('svg/${widget.cakeType.toLowerCase()}');
          },
        )
        .toList();

    print('Haizzzz: \n');
    print(imagePaths);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.cakeType,
          style: AppStyles.h3,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
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
            children: imagePaths
                .map(
                  (path) => CakeIndividualCard(imagePath: path),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
