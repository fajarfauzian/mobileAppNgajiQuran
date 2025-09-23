import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class DhikrCounterCard extends StatefulWidget {
  const DhikrCounterCard({super.key});

  @override
  State<DhikrCounterCard> createState() => _DhikrCounterCardState();
}

class _DhikrCounterCardState extends State<DhikrCounterCard> {
  int currentCount = 23;
  final int targetCount = 33;
  String currentDhikr = 'سُبْحَانَ اللهِ';
  String currentDhikrTranslation = 'Subhanallah';

  final List<Map<String, String>> dhikrList = [
    {'arabic': 'سُبْحَانَ اللهِ', 'translation': 'Subhanallah'},
    {'arabic': 'اَلْحَمْدُ لِلّٰهِ', 'translation': 'Alhamdulillah'},
    {'arabic': 'اَللّٰهُ أَكْبَرُ', 'translation': 'Allahu Akbar'},
    {'arabic': 'لَا إِلٰهَ إِلَّا اللّٰهُ', 'translation': 'La ilaha illa Allah'},
  ];

  void incrementCounter() {
    if (currentCount < targetCount) {
      setState(() {
        currentCount++;
      });
    } else {
      // Show completion and move to next dhikr
      _showCompletionDialog();
    }
  }

  void resetCounter() {
    setState(() {
      currentCount = 0;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '🎉 Selamat!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Anda telah menyelesaikan dzikir $currentDhikrTranslation sebanyak $targetCount kali',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetCounter();
            },
            child: const Text('Lanjutkan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = currentCount / targetCount;
    
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Counter Dzikir',
                style: AppTextStyles.headlineSmall,
              ),
              PopupMenuButton<Map<String, String>>(
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.textSecondary,
                ),
                onSelected: (dhikr) {
                  setState(() {
                    currentDhikr = dhikr['arabic']!;
                    currentDhikrTranslation = dhikr['translation']!;
                    currentCount = 0;
                  });
                },
                itemBuilder: (context) {
                  return dhikrList.map((dhikr) {
                    return PopupMenuItem(
                      value: dhikr,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dhikr['arabic']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dhikr['translation']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            decoration: BoxDecoration(
              color: const Color(0xFF8E44AD).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  currentDhikr,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8E44AD),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  currentDhikrTranslation,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8E44AD),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey.shade200,
                  color: const Color(0xFF8E44AD),
                ),
              ),
              Column(
                children: [
                  Text(
                    currentCount.toString(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8E44AD),
                    ),
                  ),
                  Text(
                    '/ $targetCount',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: resetCounter,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF8E44AD)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      color: Color(0xFF8E44AD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: incrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E44AD),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Tambah',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}