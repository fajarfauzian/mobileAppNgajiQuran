import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class WeeklyProgressChart extends StatelessWidget {
  const WeeklyProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    final weekData = [
      {'day': 'Sen', 'completed': 6, 'total': 7},
      {'day': 'Sel', 'completed': 7, 'total': 7},
      {'day': 'Rab', 'completed': 5, 'total': 7},
      {'day': 'Kam', 'completed': 7, 'total': 7},
      {'day': 'Jum', 'completed': 6, 'total': 7},
      {'day': 'Sab', 'completed': 7, 'total': 7},
      {'day': 'Min', 'completed': 4, 'total': 7}, 
    ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progress 7 Hari Terakhir',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF8E44AD).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '85% Rata-rata',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8E44AD),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: weekData.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              final isToday = index == weekData.length - 1;
              final progress = (data['completed'] as int) / (data['total'] as int);
              
              return Column(
                children: [
                  Container(
                    width: 32,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 32,
                          height: 80 * progress,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: isToday
                                  ? [
                                      const Color(0xFF8E44AD),
                                      const Color(0xFFAB47BC),
                                    ]
                                  : [
                                      const Color(0xFF8E44AD).withOpacity(0.7),
                                      const Color(0xFF8E44AD).withOpacity(0.9),
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Text(
                    data['day'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      color: isToday ? const Color(0xFF8E44AD) : AppColors.textSecondary,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Text(
                    '${data['completed']}/${data['total']}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: isToday ? const Color(0xFF8E44AD) : AppColors.textSecondary,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          
          const SizedBox(height: 24),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFF8E44AD),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Amalan Selesai',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Target Harian',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}