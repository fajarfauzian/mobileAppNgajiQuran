import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class ClassGrid extends StatelessWidget {
  final String selectedCategory;

  const ClassGrid({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final classes = _getFilteredClasses();
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        final classItem = classes[index];
        return _ClassCard(classItem: classItem);
      },
    );
  }

  List<Map<String, dynamic>> _getFilteredClasses() {
    final allClasses = [
      {
        'title': 'Tajwid Dasar',
        'instructor': 'Ustadz Ahmad',
        'students': '856',
        'rating': '4.9',
        'level': 'Pemula',
        'color': AppColors.info,
        'icon': Icons.quiz_rounded,
      },
      {
        'title': 'Ilmu Fiqh',
        'instructor': 'Ustadz Hakim',
        'students': '423',
        'rating': '4.8',
        'level': 'Menengah',
        'color': AppColors.warning,
        'icon': Icons.school_rounded,
      },
      {
        'title': 'Tafsir Al-Quran',
        'instructor': 'Ustadz Yusuf',
        'students': '289',
        'rating': '4.9',
        'level': 'Lanjutan',
        'color': AppColors.secondary,
        'icon': Icons.library_books_rounded,
      },
      {
        'title': 'Bahasa Arab',
        'instructor': 'Ustadzah Khadijah',
        'students': '567',
        'rating': '4.6',
        'level': 'Menengah',
        'color': AppColors.primary,
        'icon': Icons.translate_rounded,
      },
      {
        'title': 'Hadits & Sunnah',
        'instructor': 'Ustadz Ibrahim',
        'students': '334',
        'rating': '4.8',
        'level': 'Lanjutan',
        'color': Color(0xFF9C27B0),
        'icon': Icons.article_rounded,
      },
    ];

    if (selectedCategory == 'Semua') {
      return allClasses;
    }
    return allClasses.where((c) => c['level'] == selectedCategory).toList();
  }
}

class _ClassCard extends StatelessWidget {
  final Map<String, dynamic> classItem;

  const _ClassCard({required this.classItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          onTap: () {
            // Handle class tap
          },
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with icon and level
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: classItem['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        classItem['icon'],
                        color: classItem['color'],
                        size: 20,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: classItem['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        classItem['level'],
                        style: TextStyle(
                          color: classItem['color'],
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Title
                Text(
                  classItem['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 4),
                
                // Instructor
                Text(
                  classItem['instructor'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                
                const Spacer(),
                
                // Stats
                Row(
                  children: [
                    Icon(
                      Icons.people_outline_rounded,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      classItem['students'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      classItem['rating'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}