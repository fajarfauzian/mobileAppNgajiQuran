import 'package:flutter/material.dart';
import '../models/lesson_model.dart';
import '../data/lesson_data.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.lesson.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              _showLessonMenu(context);
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Header
          Container(
            color: Colors.green,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pembelajaran ${widget.lesson.id}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (widget.lesson.isCompleted)
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            widget.lesson.score.toString(),
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
                LinearProgressIndicator(
                  value: widget.lesson.isCompleted ? 1.0 : 0.3,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  color: Colors.white,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(3),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.lesson.isCompleted ? 'Selesai' : 'Sedang Belajar',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      widget.lesson.isCompleted ? '100%' : '30%',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Main Content - Focus on Letter Learning
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Title
                  Text(
                    widget.lesson.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Arabic Letter Display (Main Focus)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: Column(
                      children: [
                        // Big Arabic Letter
                        Text(
                          _getArabicLetter(),
                          style: const TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Letter Name
                        Text(
                          _getLetterName(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        
                        const SizedBox(height: 8),
                        
                        // Letter Number
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Huruf ke-${_getLetterNumber()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Letter Pronunciation
                  Container(
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
                          _getPronunciation(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            _playPronunciation();
                          },
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
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Writing Practice (if not completed)
                  if (!widget.lesson.isCompleted)
                    Container(
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
                            'Praktekkan menulis huruf ini',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.orange.shade600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                _startWritingPractice();
                              },
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
                    ),
                ],
              ),
            ),
          ),
          
          // Bottom Navigation
          Container(
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
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _nextLesson();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getArabicLetter() {
    // Extract letter based on lesson title
    if (widget.lesson.title.contains('Alif')) return 'ا';
    if (widget.lesson.title.contains('Ba')) return 'ب';
    if (widget.lesson.title.contains('Ta')) return 'ت';
    if (widget.lesson.title.contains('Tsa')) return 'ث';
    if (widget.lesson.title.contains('Jim')) return 'ج';
    if (widget.lesson.title.contains('Ha')) return 'ح';
    if (widget.lesson.title.contains('Kho')) return 'خ';
    if (widget.lesson.title.contains('Dal')) return 'د';
    if (widget.lesson.title.contains('Dzal')) return 'ذ';
    return 'ا'; // default
  }

  String _getLetterName() {
    if (widget.lesson.title.contains('Alif')) return 'Alif';
    if (widget.lesson.title.contains('Ba')) return 'Ba';
    if (widget.lesson.title.contains('Ta')) return 'Ta';
    if (widget.lesson.title.contains('Tsa')) return 'Tsa';
    if (widget.lesson.title.contains('Jim')) return 'Jim';
    if (widget.lesson.title.contains('Ha')) return 'Ha';
    if (widget.lesson.title.contains('Kho')) return 'Kho';
    if (widget.lesson.title.contains('Dal')) return 'Dal';
    if (widget.lesson.title.contains('Dzal')) return 'Dzal';
    return widget.lesson.title;
  }

  String _getLetterNumber() {
    if (widget.lesson.title.contains('Alif')) return '1';
    if (widget.lesson.title.contains('Ba')) return '2';
    if (widget.lesson.title.contains('Ta')) return '3';
    if (widget.lesson.title.contains('Tsa')) return '4';
    if (widget.lesson.title.contains('Jim')) return '5';
    if (widget.lesson.title.contains('Ha')) return '6';
    if (widget.lesson.title.contains('Kho')) return '7';
    if (widget.lesson.title.contains('Dal')) return '8';
    if (widget.lesson.title.contains('Dzal')) return '9';
    return '1';
  }

  String _getPronunciation() {
    if (widget.lesson.title.contains('Alif')) return 'A';
    if (widget.lesson.title.contains('Ba')) return 'BA';
    if (widget.lesson.title.contains('Ta')) return 'TA';
    if (widget.lesson.title.contains('Tsa')) return 'TSA';
    if (widget.lesson.title.contains('Jim')) return 'JIM';
    if (widget.lesson.title.contains('Ha')) return 'HA';
    if (widget.lesson.title.contains('Kho')) return 'KHO';
    if (widget.lesson.title.contains('Dal')) return 'DAL';
    if (widget.lesson.title.contains('Dzal')) return 'DZAL';
    return 'A';
  }

  void _showLessonMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.bookmark),
                title: const Text('Tandai Pembelajaran'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pembelajaran ditandai')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Bagikan'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Dibagikan')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _playPronunciation() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Memutar suara: ${_getPronunciation()}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _startWritingPractice() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Membuka latihan menulis...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _nextLesson() {
    // Cari lesson berikutnya
    Lesson? nextLesson = _findNextLesson();
    
    if (nextLesson != null) {
      // Navigate ke lesson berikutnya
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LessonScreen(lesson: nextLesson),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua pelajaran dalam materi ini telah selesai!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  
  Lesson? _findNextLesson() {
    final allLessons = dummyLessons;
    final currentMateriLessons = allLessons
        .where((lesson) => lesson.materiId == widget.lesson.materiId)
        .toList();
    
    currentMateriLessons.sort((a, b) => a.id.compareTo(b.id));
    
    final currentIndex = currentMateriLessons.indexWhere(
      (lesson) => lesson.id == widget.lesson.id,
    );
    
    if (currentIndex != -1 && currentIndex + 1 < currentMateriLessons.length) {
      return currentMateriLessons[currentIndex + 1];
    }
    
    return null; 
  }
}