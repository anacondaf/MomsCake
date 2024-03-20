import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CakeIndividualCard extends StatefulWidget {
  CakeIndividualCard({super.key, required this.imagePath});

  String imagePath;

  @override
  State<CakeIndividualCard> createState() => _CakeIndividualCardState();
}

class _CakeIndividualCardState extends State<CakeIndividualCard> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    // print(widget.imagePath);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.fill,
              scale: 0.4,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.withOpacity(0.3),
                  Colors.grey.withOpacity(0.1),
                ],
                stops: const [
                  0.0,
                  0.1,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.repeated,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              height: 180 / 3,
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 4.0,
                bottom: 4.0,
                right: 7.0,
              ),
              decoration: BoxDecoration(
                color: AppStyles.gray.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Coffee cake", style: AppStyles.b2),
                      Text("15 \$", style: AppStyles.b3),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 44,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppStyles.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.add,
                        size: 24,
                        color: AppStyles.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Icon(
            isFav ? CupertinoIcons.suit_heart : CupertinoIcons.suit_heart_fill,
            color: AppStyles.orange,
            size: 25,
          ),
        ),
      ],
    );
  }
}
