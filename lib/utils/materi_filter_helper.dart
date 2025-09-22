import 'package:flutter/material.dart';
import '../models/materi_model.dart';
class MateriFilterHelper {
  static List<Materi> filterMateri(List<Materi> materiList, String selectedCategory) {
    if (selectedCategory == 'Semua') {
      List<Materi> allMateri = List.from(materiList);
      allMateri.sort((a, b) {
        if (a.progressValue == 1.0 && b.progressValue != 1.0) return -1;
        if (b.progressValue == 1.0 && a.progressValue != 1.0) return 1;
        if (a.progressValue > 0 && b.progressValue == 0) return -1;
        if (b.progressValue > 0 && a.progressValue == 0) return 1;
        return a.id.compareTo(b.id);
      });
      return allMateri;
    }
    return materiList.where((materi) => materi.category == selectedCategory).toList();
  }

  static Map<String, int> getStats(List<Materi> materiList) {
    final total = materiList.length;
    final completed = materiList.where((m) => m.progressValue == 1.0).length;
    final inProgress = materiList.where((m) => m.progressValue > 0 && m.progressValue < 1.0).length;
    
    return {
      'total': total,
      'completed': completed,
      'inProgress': inProgress,
    };
  }

  static String getStatusText(double progressValue) {
    if (progressValue == 1.0) return 'Selesai';
    if (progressValue > 0) return 'Berlangsung';
    return 'Belum Mulai';
  }

  static Color getStatusColor(double progressValue) {
    if (progressValue == 1.0) return Colors.green;
    if (progressValue > 0) return Colors.orange;
    return Colors.grey;
  }

  static IconData getStatusIcon(double progressValue) {
    if (progressValue == 1.0) return Icons.check_circle;
    if (progressValue > 0) return Icons.play_circle;
    return Icons.circle_outlined;
  }
}