import 'package:flutter/material.dart';
import '../models/lesson_model.dart';
import '../data/lesson_data.dart';
import '../widgets/lesson/lesson_header.dart';
import '../widgets/lesson/letter_display_card.dart';
import '../widgets/lesson/letter_navigation_bar.dart';
import '../widgets/lesson/pronunciation_card.dart';
import '../widgets/lesson/writing_practice_card.dart';
import '../widgets/lesson/lesson_bottom_navigation.dart';
import '../utils/lesson_helper.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int currentLetterIndex = 0;
  
  List<Map<String, String>> get currentLessonLetters {
    return LessonHelper.getLessonLetters(widget.lesson.title);
  }

  @override
  Widget build(BuildContext context) {
    final letters = currentLessonLetters;
    final currentLetter = letters[currentLetterIndex];
    
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
            onPressed: () => _showLessonMenu(context),
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Header
          LessonHeader(
            lesson: widget.lesson,
            currentLetterIndex: currentLetterIndex,
            totalLetters: letters.length,
          ),
          
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
                  
                  LetterDisplayCard(letter: currentLetter),
                  
                  const SizedBox(height: 30),
                  
                  if (letters.length > 1)
                    LetterNavigationBar(
                      letters: letters,
                      currentIndex: currentLetterIndex,
                      onLetterSelected: (index) {
                        setState(() {
                          currentLetterIndex = index;
                        });
                      },
                    ),
                  
                  if (letters.length > 1) const SizedBox(height: 30),
                  
                  // Letter Pronunciation
                  PronunciationCard(
                    letter: currentLetter,
                    onPlaySound: () => _playPronunciation(currentLetter),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Writing Practice (if not completed)
                  if (!widget.lesson.isCompleted)
                    WritingPracticeCard(
                      letter: currentLetter,
                      onStartPractice: () => _startWritingPractice(currentLetter),
                    ),
                ],
              ),
            ),
          ),
          
          // Bottom Navigation
          LessonBottomNavigation(
            letters: letters,
            currentLetterIndex: currentLetterIndex,
            onPreviousPressed: () {
              setState(() {
                currentLetterIndex--;
              });
            },
            onNextPressed: () {
              if (currentLetterIndex < letters.length - 1) {
                setState(() {
                  currentLetterIndex++;
                });
              } else {
                _nextLesson();
              }
            },
            onBackPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
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

  void _playPronunciation(Map<String, String> letter) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Memutar suara: ${letter['pronunciation']!}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _startWritingPractice(Map<String, String> letter) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membuka latihan menulis huruf ${letter['name']!}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _nextLesson() {
    Lesson? nextLesson = LessonHelper.findNextLesson(widget.lesson, dummyLessons);
    
    if (nextLesson != null) {
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
}