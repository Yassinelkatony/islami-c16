class DhikrModel {
  final String mainText;

  final String tasbeehText;

  DhikrModel({required this.mainText, required this.tasbeehText});

  @override
  String toString() {
    return 'DhikrModel(mainText: $mainText, tasbeehText: $tasbeehText)';
  }
}

List<DhikrModel> dhikrsList = [
  DhikrModel(
    mainText: 'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
    tasbeehText: 'سبحان الله',
  ),
  DhikrModel(
    mainText: 'احمد الله واستغفر الله',
    tasbeehText: 'الحمد لله',
  ),
  DhikrModel(
    mainText: 'احمد الله واستغفر الله',
    tasbeehText: 'أستغفر الله',
  ),
];
