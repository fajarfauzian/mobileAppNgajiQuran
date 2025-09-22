import 'package:flutter/material.dart';

class WritingPracticeCard extends StatelessWidget {
  final Map<String, String> letter;
  final VoidCallback onStartPractice;

  const WritingPracticeCard({
    super.key,
    required this.letter,
    required this.onStartPractice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        children: [
          Icon(
            Icons.edit,
            color: Colors.orange.shade600,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            'Latihan Menulis',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Praktekkan menulis huruf ${letter['name']!}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange.shade600,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onStartPractice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Mulai Latihan Menulis',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}