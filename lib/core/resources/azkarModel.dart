class Azkar {
  final String mainText;
  final String tasbeehText;

  Azkar({required this.mainText, required this.tasbeehText});

  @override
  String toString() {
    return 'Azkar(mainText: $mainText, tasbeehText: $tasbeehText)';
  }
}

List<Azkar> azkarList = [
  Azkar(
    mainText: 'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
    tasbeehText: 'سبحان الله',
  ),
  Azkar(
    mainText: 'احمد الله واستغفر الله',
    tasbeehText: 'الحمد لله',
  ),
  Azkar(
    mainText: 'احمد الله واستغفر الله',
    tasbeehText: 'أستغفر الله',
  ),
];

