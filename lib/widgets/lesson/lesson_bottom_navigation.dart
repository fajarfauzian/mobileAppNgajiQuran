import 'package:flutter/material.dart';

class LessonBottomNavigation extends StatelessWidget {
  final List<Map<String, String>> letters;
  final int currentLetterIndex;
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;

  const LessonBottomNavigation({
    super.key,
    required this.letters,
    required this.currentLetterIndex,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Previous Letter/Back Button
          if (letters.length > 1 && currentLetterIndex > 0)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPreviousPressed,
                icon: const Icon(Icons.arrow_back),
                label:
                    Text('Huruf ${letters[currentLetterIndex - 1]['name']!}'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green.shade600),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: OutlinedButton(
                onPressed: onBackPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green.shade600),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Kembali',
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          const SizedBox(width: 12),

          // Next Letter/Lesson Button
          Expanded(
            child: ElevatedButton(
              onPressed: onNextPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLetterIndex < letters.length - 1
                        ? 'Huruf ${letters[currentLetterIndex + 1]['name']!}'
                        : 'Pembelajaran Selanjutnya',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
