import '../models/materi_model.dart';

class HomeHelper {
  static List<Materi> getFilteredMateri(List<Materi> materiList, String selectedCategory) {
    return materiList.where((materi) => materi.category == selectedCategory).toList();
  }

  static Materi getCurrentLearning(List<Materi> materiList) {
    return materiList.firstWhere(
      (materi) => materi.progressValue > 0 && materi.progressValue < 1,
      orElse: () => materiList.first,
    );
  }
}