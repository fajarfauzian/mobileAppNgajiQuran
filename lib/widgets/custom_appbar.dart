import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex, // ini sekarang 0..4
      onTap: onTap,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          label: 'Kelas',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage("assets/images/icon_quran.png"),
            size: 28,
          ),
          label: '', // tidak ada teks untuk item tengah
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Tadarus',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.nights_stay),
          label: 'Amalan',
        ),
      ],
    );
  }
}
