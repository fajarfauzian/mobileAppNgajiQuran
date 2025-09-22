import 'package:flutter/material.dart';
import '../widgets/materi_card.dart';
import '../widgets/home/hero_banner.dart';
import '../widgets/home/current_learning_card.dart';
import '../widgets/home/category_selector.dart';
import '../models/materi_model.dart';
import '../data/materi_data.dart';
import '../utils/home_helper.dart';
import 'all_lessons_screen.dart';
import 'materi_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Pra Tahsin';
  
  List<Materi> getFilteredMateri() {
    return HomeHelper.getFilteredMateri(dummyMateri, selectedCategory);
  }

  Materi getCurrentLearning() {
    return HomeHelper.getCurrentLearning(dummyMateri);
  }

  @override
  Widget build(BuildContext context) {
    final filteredMateri = getFilteredMateri();
    final currentLearning = getCurrentLearning();
    
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        // Hero Banner
        HeroBanner(
          onViewAllPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllLessonsScreen(),
              ),
            );
          },
        ),
        
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Current Learning Card
              CurrentLearningCard(
                materi: currentLearning,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MateriDetailScreen(materi: currentLearning),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 20),
              
              // Category Selector
              CategorySelector(
                selectedCategory: selectedCategory,
                onCategoryChanged: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              
              const SizedBox(height: 16),
              
              // Materi Cards
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredMateri.length,
                  itemBuilder: (context, index) {
                    final materi = filteredMateri[index];
                    return Container(
                      width: 280,
                      margin: EdgeInsets.only(
                        right: index == filteredMateri.length - 1 ? 0 : 12,
                      ),
                      child: MateriCard(
                        badgeText: materi.badgeText,
                        title: materi.title,
                        label: materi.category,
                        progressText: materi.progressText,
                        progressValue: materi.progressValue,
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
        ),
      ],
    );
  }
}