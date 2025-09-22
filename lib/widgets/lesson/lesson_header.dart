import 'package:flutter/material.dart';
import '../../models/lesson_model.dart';

class LessonHeader extends StatelessWidget {
  final Lesson lesson;
  final int currentLetterIndex;
  final int totalLetters;

  const LessonHeader({
    super.key,
    required this.lesson,
    required this.currentLetterIndex,
    required this.totalLetters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pembelajaran ${lesson.id}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (lesson.isCompleted)
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      lesson.score.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Letter progress indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Huruf ${currentLetterIndex + 1} dari $totalLetters',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
              Text(
                '${((currentLetterIndex + 1) / totalLetters * 100).round()}%',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (currentLetterIndex + 1) / totalLetters,
            backgroundColor: Colors.white.withOpacity(0.3),
            color: Colors.white,
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
        ],
      ),
    );
  }
}