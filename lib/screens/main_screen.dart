import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'kelas_screen.dart';
import 'tadarus_screen.dart';
import 'amalan_screen.dart';
import '../widgets/custom_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _navIndex = 0;
  int _pageIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    KelasScreen(),
    TadarusScreen(),
    AmalanScreen(),
  ];

  void _onNavTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const QuranReaderScreen(),
        ),
      );
      return;
    }

    setState(() {
      _navIndex = index;
      _pageIndex = index > 2 ? index - 1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _pages[_pageIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _navIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}

class QuranReaderScreen extends StatelessWidget {
  const QuranReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Al-Quran',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book_rounded,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 24),
            Text(
              'Al-Quran Digital',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Halaman Al-Quran akan segera hadir',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}