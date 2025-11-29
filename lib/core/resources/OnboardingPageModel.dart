class OnboardingPageModel {
  final String imagePath;

  final String title;

  final String subtitle;

  const OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  String toString() {
    return 'OnboardingPageModel(imagePath: $imagePath, title: $title, subtitle: $subtitle)';
  }
}

List<OnboardingPageModel> onboardingPages = [
  const OnboardingPageModel(
imagePath: 'assets/intro task/nrahbbekom.png',
title: 'Welcome To Islami App',
subtitle: '',
), const OnboardingPageModel(
    imagePath: 'assets/intro task/do3a2.png',
    title: 'Bearish',
    subtitle: 'Praise the name of your Lord, the Most High',
  ),
  const OnboardingPageModel(
    imagePath: 'assets/intro task/moshaf.png',
    title: 'Reading the Quran',
    subtitle: 'Read, and your Lord is the Most Generous',
  ),
  const OnboardingPageModel(
    imagePath: 'assets/intro task/gam3.png',
    title: 'Welcome To Islami',
    subtitle: 'We Are Very Excited To Have You In Our Community',
  ),

  const OnboardingPageModel(
    imagePath: 'assets/intro task/maic.png',
    title: 'Holy Quran Radio',
    subtitle: 'You can listen to the Holy Quran Radio through the application for free and easily',
  ),
];
