import 'package:flutter/material.dart';
import '../utils/constants.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: AppDimensions.paddingMedium,
      crossAxisSpacing: AppDimensions.paddingMedium,
      childAspectRatio: 1.1,
      children: [
        _QuickAccessItem(
          icon: Icons.quiz_rounded,
          label: 'Kuis',
          color: AppColors.info,
          onTap: () {
          },
        ),
        _QuickAccessItem(
          icon: Icons.volume_up_rounded,
          label: 'Audio',
          color: AppColors.success,
          onTap: () {
          },
        ),
        _QuickAccessItem(
          icon: Icons.bookmark_rounded,
          label: 'Bookmark',
          color: AppColors.warning,
          onTap: () {
          },
        ),
        _QuickAccessItem(
          icon: Icons.history_rounded,
          label: 'Riwayat',
          color: AppColors.secondary,
          onTap: () {
          },
        ),
        _QuickAccessItem(
          icon: Icons.settings_rounded,
          label: 'Pengaturan',
          color: AppColors.textSecondary,
          onTap: () {
          },
        ),
        _QuickAccessItem(
          icon: Icons.help_rounded,
          label: 'Bantuan',
          color: AppColors.primary,
          onTap: () {
          },
        ),
      ],
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}