import 'package:flutter/material.dart';
import '../models/materi_model.dart';
import '../data/materi_data.dart';
import '../widgets/all_lessons/category_filter_bar.dart';
import '../widgets/all_lessons/stats_row.dart';
import '../widgets/all_lessons/lesson_item_card.dart';
import '../utils/materi_filter_helper.dart';
import 'materi_detail_screen.dart';

class AllLessonsScreen extends StatefulWidget {
  const AllLessonsScreen({super.key});

  @override
  State<AllLessonsScreen> createState() => _AllLessonsScreenState();
}

class _AllLessonsScreenState extends State<AllLessonsScreen> {
  String selectedCategory = 'Semua';
  
  List<Materi> getFilteredMateri() {
    return MateriFilterHelper.filterMateri(dummyMateri, selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    final filteredMateri = getFilteredMateri();
    
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Semua Pelajaran',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Filter
          CategoryFilterBar(
            selectedCategory: selectedCategory,
            onCategoryChanged: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          
          // Stats Row
          StatsRow(materiList: dummyMateri),
          
          const Divider(height: 1),
          
          // Lessons List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredMateri.length,
              itemBuilder: (context, index) {
                final materi = filteredMateri[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: LessonItemCard(
                    materi: materi,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MateriDetailScreen(materi: materi),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}