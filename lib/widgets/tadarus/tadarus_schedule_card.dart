import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class TadarusScheduleCard extends StatelessWidget {
  const TadarusScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    final schedules = [
      {
        'time': '05:30',
        'title': 'Tadarus Subuh',
        'surah': 'Al-Baqarah 1-5',
        'status': 'completed',
      },
      {
        'time': '13:00',
        'title': 'Tadarus Dzuhur',
        'surah': 'Al-Baqarah 6-10',
        'status': 'active',
      },
      {
        'time': '19:00',
        'title': 'Tadarus Maghrib',
        'surah': 'Al-Baqarah 11-15',
        'status': 'upcoming',
      },
    ];

    return Column(
      children: schedules.map((schedule) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(AppDimensions.paddingMedium),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: Border.all(
              color: _getStatusColor(schedule['status'] as String).withOpacity(0.2),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _getStatusColor(schedule['status'] as String).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      schedule['time']!.split(':')[0],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _getStatusColor(schedule['status'] as String),
                      ),
                    ),
                    Text(
                      schedule['time']!.split(':')[1],
                      style: TextStyle(
                        fontSize: 12,
                        color: _getStatusColor(schedule['status'] as String),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 16),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      schedule['surah']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              
              _buildStatusIcon(schedule['status'] as String),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return AppColors.success;
      case 'active':
        return const Color(0xFF4A90E2);
      case 'upcoming':
        return AppColors.textSecondary;
      default:
        return AppColors.textSecondary;
    }
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'completed':
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: AppColors.success,
            size: 16,
          ),
        );
      case 'active':
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF4A90E2).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Color(0xFF4A90E2),
            size: 16,
          ),
        );
      case 'upcoming':
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.textSecondary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.schedule,
            color: AppColors.textSecondary,
            size: 16,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}