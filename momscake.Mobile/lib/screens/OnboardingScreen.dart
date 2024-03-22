import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/svg.dart";
import "package:gap/gap.dart";
import "package:google_fonts/google_fonts.dart";
import "package:moms_cake/screens/SplashScreen.dart";

import "../app_styles.dart";

class OnboardingData {
  String title;
  String subTitle;

  OnboardingData(this.title, this.subTitle);
}

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
  late PageController _pageController;

  int _pageIndex = 0;
  bool isReachLastPage = false;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
    );
    super.initState();
  }

  void _splashScreenNavigator() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (builder) => const SplashScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        if (index == onboardingDatas.length - 1) {
          setState(() {
            isReachLastPage = true;
          });
        }

        setState(() {
          _pageIndex = index;
        });
      },
      itemCount: onboardingDatas.length,
      itemBuilder: (context, index) {
        var title = onboardingDatas[index].title;
        var subTitle = onboardingDatas[index].subTitle;
        var image =
            onboardingDatas[index].title.toLowerCase().replaceAll(' ', '');

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
                      Positioned(
                        bottom: 48,
                        right: 30,
                        child: Image.asset(
                          "assets/svg/onboardings/casual.png",
                          width: 98,
                          height: 98,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: InkWell(
                                    onTap: _splashScreenNavigator,
                                    child: const Text(
                                      "Skip",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              "assets/svg/onboardings/$image.svg",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                onboardingDatas.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: DotIndicator(
                                    isActive: _pageIndex == index,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            !isReachLastPage
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Ink(
                                        color: AppStyles.orange,
                                        width: 64,
                                        height: 64,
                                        child: InkWell(
                                          onTap: () {
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Icon(
                                            CupertinoIcons.right_chevron,
                                            color: AppStyles.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Material(
                                      child: Ink(
                                        color: AppStyles.orange,
                                        width: 185,
                                        height: 64,
                                        child: InkWell(
                                          onTap: _splashScreenNavigator,
                                          child: Center(
                                            child: Text(
                                              "Get's started",
                                              style: TextStyle(
                                                color: AppStyles.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
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
      },
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppStyles.orange),
        color: isActive ? AppStyles.orange : null,
      ),
    );
  }
}
