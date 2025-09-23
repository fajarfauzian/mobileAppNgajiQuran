import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final prayers = [
      {'name': 'Subuh', 'time': '05:15', 'status': 'completed'},
      {'name': 'Dzuhur', 'time': '12:30', 'status': 'completed'},
      {'name': 'Ashar', 'time': '15:45', 'status': 'current'},
      {'name': 'Maghrib', 'time': '18:20', 'status': 'upcoming'},
      {'name': 'Isya', 'time': '19:35', 'status': 'upcoming'},
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
              Text(
                'Waktu Sholat',
                style: AppTextStyles.headlineSmall,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Depok',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8E44AD),
                  Color(0xFF732D91),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selanjutnya',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                    const Text(
                      'Ashar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '15:45',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '45 menit lagi',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // All Prayer Times
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: prayers.map((prayer) {
              return _PrayerTimeItem(
                name: prayer['name']!,
                time: prayer['time']!,
                status: prayer['status']!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _PrayerTimeItem extends StatelessWidget {
  final String name;
  final String time;
  final String status;

  const _PrayerTimeItem({
    required this.name,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color getStatusColor() {
      switch (status) {
        case 'completed':
          return AppColors.success;
        case 'current':
          return const Color(0xFF8E44AD);
        case 'upcoming':
          return AppColors.textSecondary;
        default:
          return AppColors.textSecondary;
      }
    }

    return Column(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: getStatusColor(),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: status == 'current' ? const Color(0xFF8E44AD) : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: getStatusColor(),
          ),
        ),
      ],
    );
  }
}