import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:gap/gap.dart";
import "package:google_fonts/google_fonts.dart";

import "../app_styles.dart";

class OnboardingData {
  String title;
  String subTitle;

  OnboardingData(this.title, this.subTitle);
}

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  List<OnboardingData> onboardingDatas = [
    OnboardingData(
      "Outdoor party",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    ),
    OnboardingData(
      "Having fun",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    ),
    OnboardingData(
      "Family",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    ),
    OnboardingData(
      "Celebrating",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        var assetName =
            onboardingDatas[index].title.toLowerCase().replaceAll(' ', '');

        return OnboardingContent(
          title: onboardingDatas[index].title,
          subTitle: onboardingDatas[index].subTitle,
          image: "assets/svg/onboardings/$assetName.svg",
        );
      },
    );
  }
}

class OnboardingContent extends StatelessWidget {
  OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.onboardingDarkBg,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppStyles.white,
          ),
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: [
                  Positioned(
                    bottom: constraint.maxHeight * -0.3,
                    right: constraint.maxWidth * -0.5,
                    child: Image.asset(
                      "assets/svg/onboardings/circle.png",
                      width: 512,
                      height: 512,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const Spacer(),
                        SvgPicture.asset(
                          image,
                          width: 256,
                          height: 256,
                        ),
                        const Gap(32.0),
                        Text(
                          title,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Color(0xFF00093c),
                            ),
                          ),
                        ),
                        const Gap(14.0),
                        Text(
                          subTitle,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: AppStyles.obSubtitle,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppStyles.orange,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Get's started",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: AppStyles.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
