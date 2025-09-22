import 'package:flutter/material.dart';

class PronunciationCard extends StatelessWidget {
  final Map<String, String> letter;
  final VoidCallback onPlaySound;

  const PronunciationCard({
    super.key,
    required this.letter,
    required this.onPlaySound,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        children: [
          Icon(
            Icons.volume_up,
            color: Colors.blue.shade600,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            'Cara Baca',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            letter['pronunciation']!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onPlaySound,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Dengar Suara'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 20, 
                vertical: 12
              ),
            ),
          ),
        ],
      ),
    );
  }
}