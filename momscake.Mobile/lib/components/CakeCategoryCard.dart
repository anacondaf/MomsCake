import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moms_cake/screens/CategoryViewScreen.dart';

import '../app_styles.dart';

class CakeCategoryCard extends StatelessWidget {
  String cakeType;
  CakeCategoryCard({
    required this.cakeType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryViewScreen(
              cakeType: cakeType,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          children: [
            SizedBox(
              width: 92,
              height: 92,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/svg/category_${cakeType.toLowerCase()}.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(8.0),
            Text(
              cakeType,
              style: AppStyles.b3,
            ),
          ],
        ),
      ),
    );
  }
}
