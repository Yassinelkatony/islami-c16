import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/OnboardingPageModel.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/StringsManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        backgroundColor: ColorManager.blackColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(
            AssetsManager.islamiLogo,
            height: 100,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildPage(onboardingPages[index]);
              },
            ),
          ),
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPageModel page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            page.imagePath,
            height: page.imagePath == 'assets/images/intro task/nrahbbekom.png' ? 150 : 200,
          ),
          SizedBox(height: 50),
          Text(
            page.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: ColorManager.goldColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 50),
          page.subtitle.isNotEmpty
              ? Text(
                  page.subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorManager.goldColor,
                      ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _currentPage != 0
              ? TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    StringsManager.back,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorManager.goldColor,
                        ),
                  ),
                )
              : SizedBox(width: 70),
          Row(
            children: List.generate(
              onboardingPages.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: _currentPage == index ? 25 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? ColorManager.goldColor
                      : ColorManager.lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          _currentPage != onboardingPages.length - 1
              ? TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    StringsManager.next,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorManager.goldColor,
                        ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
                  },
                  child: Text(
                    StringsManager.finish,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorManager.goldColor,
                        ),
                  ),
                ),
        ],
      ),
    );
  }
}
