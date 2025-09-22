import '../models/lesson_model.dart';

class LessonHelper {
  static List<Map<String, String>> getLessonLetters(String lessonTitle) {
    if (lessonTitle.contains('Alif dan Ba')) {
      return [
        {'letter': 'ا', 'name': 'Alif', 'pronunciation': 'A', 'number': '1'},
        {'letter': 'ب', 'name': 'Ba', 'pronunciation': 'BA', 'number': '2'},
      ];
    } else if (lessonTitle.contains('Ta dan Tsa')) {
      return [
        {'letter': 'ت', 'name': 'Ta', 'pronunciation': 'TA', 'number': '3'},
        {'letter': 'ث', 'name': 'Tsa', 'pronunciation': 'TSA', 'number': '4'},
      ];
    } else if (lessonTitle.contains('Jim, Ha, Kho')) {
      return [
        {'letter': 'ج', 'name': 'Jim', 'pronunciation': 'JIM', 'number': '5'},
        {'letter': 'ح', 'name': 'Ha', 'pronunciation': 'HA', 'number': '6'},
        {'letter': 'خ', 'name': 'Kho', 'pronunciation': 'KHO', 'number': '7'},
      ];
    } else if (lessonTitle.contains('Dal dan Dzal')) {
      return [
        {'letter': 'د', 'name': 'Dal', 'pronunciation': 'DAL', 'number': '8'},
        {'letter': 'ذ', 'name': 'Dzal', 'pronunciation': 'DZAL', 'number': '9'},
      ];
    } else if (lessonTitle.contains('Bentuk Huruf di Awal')) {
      return [
        {'letter': 'بـ', 'name': 'Ba Awal', 'pronunciation': 'BA', 'number': 'Bentuk Awal'},
        {'letter': 'تـ', 'name': 'Ta Awal', 'pronunciation': 'TA', 'number': 'Bentuk Awal'},
        {'letter': 'جـ', 'name': 'Jim Awal', 'pronunciation': 'JIM', 'number': 'Bentuk Awal'},
      ];
    } else if (lessonTitle.contains('Bentuk Huruf di Tengah')) {
      return [
        {'letter': 'ـبـ', 'name': 'Ba Tengah', 'pronunciation': 'BA', 'number': 'Bentuk Tengah'},
        {'letter': 'ـتـ', 'name': 'Ta Tengah', 'pronunciation': 'TA', 'number': 'Bentuk Tengah'},
        {'letter': 'ـجـ', 'name': 'Jim Tengah', 'pronunciation': 'JIM', 'number': 'Bentuk Tengah'},
      ];
    } else if (lessonTitle.contains('Bentuk Huruf di Akhir')) {
      return [
        {'letter': 'ـب', 'name': 'Ba Akhir', 'pronunciation': 'BA', 'number': 'Bentuk Akhir'},
        {'letter': 'ـت', 'name': 'Ta Akhir', 'pronunciation': 'TA', 'number': 'Bentuk Akhir'},
        {'letter': 'ـج', 'name': 'Jim Akhir', 'pronunciation': 'JIM', 'number': 'Bentuk Akhir'},
      ];
    } else if (lessonTitle.contains('Fathah')) {
      return [
        {'letter': 'بَ', 'name': 'Ba Fathah', 'pronunciation': 'BA', 'number': 'Fathah'},
        {'letter': 'تَ', 'name': 'Ta Fathah', 'pronunciation': 'TA', 'number': 'Fathah'},
        {'letter': 'جَ', 'name': 'Jim Fathah', 'pronunciation': 'JA', 'number': 'Fathah'},
      ];
    } else if (lessonTitle.contains('Kasrah')) {
      return [
        {'letter': 'بِ', 'name': 'Ba Kasrah', 'pronunciation': 'BI', 'number': 'Kasrah'},
        {'letter': 'تِ', 'name': 'Ta Kasrah', 'pronunciation': 'TI', 'number': 'Kasrah'},
        {'letter': 'جِ', 'name': 'Jim Kasrah', 'pronunciation': 'JI', 'number': 'Kasrah'},
      ];
    } else if (lessonTitle.contains('Dhammah')) {
      return [
        {'letter': 'بُ', 'name': 'Ba Dhammah', 'pronunciation': 'BU', 'number': 'Dhammah'},
        {'letter': 'تُ', 'name': 'Ta Dhammah', 'pronunciation': 'TU', 'number': 'Dhammah'},
        {'letter': 'جُ', 'name': 'Jim Dhammah', 'pronunciation': 'JU', 'number': 'Dhammah'},
      ];
    }
    
    // Default fallback
    return [
      {'letter': 'ا', 'name': 'Alif', 'pronunciation': 'A', 'number': '1'},
    ];
  }

  static Lesson? findNextLesson(Lesson currentLesson, List<Lesson> allLessons) {
    final currentMateriLessons = allLessons
        .where((lesson) => lesson.materiId == currentLesson.materiId)
        .toList();
    
    currentMateriLessons.sort((a, b) => a.id.compareTo(b.id));
    
    final currentIndex = currentMateriLessons.indexWhere(
      (lesson) => lesson.id == currentLesson.id,
    );
    
    if (currentIndex != -1 && currentIndex + 1 < currentMateriLessons.length) {
      return currentMateriLessons[currentIndex + 1];
    }
    
    return null;
  }
}