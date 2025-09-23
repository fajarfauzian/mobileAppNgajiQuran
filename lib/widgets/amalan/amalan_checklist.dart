import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AmalanChecklist extends StatefulWidget {
  const AmalanChecklist({super.key});

  @override
  State<AmalanChecklist> createState() => _AmalanChecklistState();
}

class _AmalanChecklistState extends State<AmalanChecklist> {
  List<Map<String, dynamic>> amalList = [
    {
      'title': 'Sholat Subuh',
      'icon': Icons.wb_sunny_outlined,
      'completed': true,
      'time': '05:15',
    },
    {
      'title': 'Membaca Al-Quran',
      'icon': Icons.menu_book_outlined,
      'completed': true,
      'time': '06:00',
    },
    {
      'title': 'Dzikir Pagi',
      'icon': Icons.favorite_border,
      'completed': true,
      'time': '07:00',
    },
    {
      'title': 'Sholat Dzuhur',
      'icon': Icons.wb_sunny,
      'completed': true,
      'time': '12:30',
    },
    {
      'title': 'Sholat Ashar',
      'icon': Icons.wb_twilight,
      'completed': false,
      'time': '15:45',
    },
    {
      'title': 'Sholat Maghrib',
      'icon': Icons.nights_stay_outlined,
      'completed': false,
      'time': '18:20',
    },
    {
      'title': 'Sholat Isya',
      'icon': Icons.bedtime_outlined,
      'completed': false,
      'time': '19:35',
    },
  ];

  void toggleCompletion(int index) {
    setState(() {
      amalList[index]['completed'] = !amalList[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
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
      child: Column(
        children: amalList.asMap().entries.map((entry) {
          final index = entry.key;
          final amal = entry.value;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => toggleCompletion(index),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: amal['completed'] 
                        ? AppColors.success.withOpacity(0.1)
                        : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: amal['completed']
                          ? AppColors.success.withOpacity(0.3)
                          : Colors.grey.shade200,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: amal['completed']
                              ? AppColors.success
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: amal['completed']
                                ? AppColors.success
                                : Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        child: amal['completed']
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : null,
                      ),
                      
                      const SizedBox(width: 16),
                      
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: amal['completed']
                              ? AppColors.success.withOpacity(0.2)
                              : const Color(0xFF8E44AD).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          amal['icon'],
                          color: amal['completed']
                              ? AppColors.success
                              : const Color(0xFF8E44AD),
                          size: 20,
                        ),
                      ),
                      
                      const SizedBox(width: 16),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              amal['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: amal['completed']
                                    ? AppColors.success
                                    : AppColors.textPrimary,
                                decoration: amal['completed']
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              amal['time'],
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      if (amal['completed'])
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Selesai',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.success,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}