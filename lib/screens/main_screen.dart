import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'kelas_screen.dart';
import 'tadarus_screen.dart';
import 'amalan_screen.dart';
import '../widgets/custom_appbar.dart'; // pastikan ini file navbar

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // _navIndex adalah posisi di bottom nav (0..4)
  // _pageIndex adalah index di daftar halaman (0..3)
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
      // item tengah: hanya icon, tidak navigasi
      // kamu bisa ganti jadi open modal / showDialog jika mau
      return;
    }

    setState(() {
      _navIndex = index;
      // jika index > 2, geser -1 agar sesuai list _pages
      _pageIndex = index > 2 ? index - 1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _navIndex,
        onTap: _onNavTapped,
      ),
      // Hapus floatingActionButton supaya icon tengah tidak tertutup
    );
  }
}
