import 'package:flutter/material.dart';
import '../models/surah_model.dart';

class SurahCard extends StatelessWidget {
  final Surah surah;

  const SurahCard({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            surah.id.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(surah.name),
        subtitle: Text("${surah.ayatCount} ayat"),
      ),
    );
  }
}
