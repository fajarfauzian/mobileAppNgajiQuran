import 'package:flutter/material.dart';
import '../widgets/materi_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          "Ayo Belajar Ngaji!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        MateriCard(
          badgeText: "Materi 1",
          title: "Belajar Huruf Hijaiyah",
          label: "Pra Tahsin",
          progressText: "6/14 pelajaran",
          progressValue: 6 / 14,
        ),
        MateriCard(
          badgeText: "Materi 2",
          title: "Belajar Bentuk dan Bacaan",
          label: "Pra Tahsin",
          progressText: "10/20 pelajaran",
          progressValue: 10 / 20,
        ),
      ],
    );
  }
}
