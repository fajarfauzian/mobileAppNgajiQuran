import 'package:flutter/material.dart';
import '../../models/materi_model.dart';
import '../../utils/materi_filter_helper.dart';

class LessonItemCard extends StatelessWidget {
  final Materi materi;
  final VoidCallback onTap;

  const LessonItemCard({
    super.key,
    required this.materi,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = MateriFilterHelper.getStatusColor(materi.progressValue);
    final statusText = MateriFilterHelper.getStatusText(materi.progressValue);
    final statusIcon = MateriFilterHelper.getStatusIcon(materi.progressValue);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                  size: 24,
                ),
              ),
              
              const SizedBox(width: 16),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        materi.badgeText,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    Text(
                      materi.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    Text(
                      materi.category,
                      style: TextStyle(
                        color: materi.category == 'Pra Tahsin' 
                            ? Colors.orange.shade700 
                            : Colors.blue.shade700,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: materi.progressValue,
                            backgroundColor: Colors.grey.shade300,
                            color: statusColor,
                            minHeight: 6,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          materi.progressText,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 12),
              
              Column(
                children: [
                  Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  if (materi.progressValue > 0 && materi.progressValue < 1.0)
                    Text(
                      '${(materi.progressValue * 100).round()}%',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}