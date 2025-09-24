import 'package:flutter/material.dart';
import '../models/surah_model.dart';
import '../utils/constants.dart';
import '../widgets/quran/ayah_card.dart';

class SurahDetailScreen extends StatefulWidget {
  final Surah surah;

  const SurahDetailScreen({super.key, required this.surah});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  bool showTranslation = true;
  bool showTafsir = false;
  double fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => _showOptionsMenu(),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.more_vert_rounded,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2E7D32),
                      Color(0xFF4CAF50),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.paddingLarge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Surah Number
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            widget.surah.id.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Surah Name
                        Text(
                          widget.surah.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Surah Info
                        Text(
                          '${widget.surah.ayatCount} Ayat • ${_getRevelationType()}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bismillah (except for At-Taubah)
          if (widget.surah.id != 9)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(AppDimensions.paddingMedium),
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
                    Text(
                      'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                      style: TextStyle(
                        fontSize: fontSize + 4,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        height: 1.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (showTranslation) ...[
                      const SizedBox(height: 12),
                      Text(
                        'Dengan nama Allah Yang Maha Pengasih, Maha Penyayang',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),

          // Ayah List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final ayahNumber = index + 1;
                return AyahCard(
                  ayahNumber: ayahNumber,
                  arabicText: _getAyahText(ayahNumber),
                  translation: showTranslation ? _getAyahTranslation(ayahNumber) : null,
                  tafsir: showTafsir ? _getAyahTafsir(ayahNumber) : null,
                  fontSize: fontSize,
                  onBookmark: () => _bookmarkAyah(ayahNumber),
                  onShare: () => _shareAyah(ayahNumber),
                  onPlay: () => _playAyah(ayahNumber),
                );
              },
              childCount: widget.surah.ayatCount,
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  String _getRevelationType() {
    final makkiyahSurahs = [1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 50, 51, 52, 53, 54, 55, 56, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 111, 112, 113, 114];

    return makkiyahSurahs.contains(widget.surah.id) ? 'Makkiyah' : 'Madaniyah';
  }

  String _getAyahText(int ayahNumber) {
    // Dummy Arabic text for demonstration
    if (widget.surah.id == 1) { // Al-Fatihah
      switch (ayahNumber) {
        case 1: return 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ';
        case 2: return 'الرَّحْمَٰنِ الرَّحِيمِ';
        case 3: return 'مَالِكِ يَوْمِ الدِّينِ';
        case 4: return 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ';
        case 5: return 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ';
        case 6: return 'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ';
        default: return 'اللهُ أَعْلَمُ';
      }
    }
    return 'وَمَا أَرْسَلْنَاكَ إِلَّا رَحْمَةً لِّلْعَالَمِينَ';
  }

  String _getAyahTranslation(int ayahNumber) {
    // Dummy translations
    if (widget.surah.id == 1) {
      switch (ayahNumber) {
        case 1: return 'Segala puji bagi Allah, Tuhan semesta alam';
        case 2: return 'Yang Maha Pengasih, Maha Penyayang';
        case 3: return 'Pemilik hari pembalasan';
        case 4: return 'Hanya kepada Engkaulah kami menyembah dan hanya kepada Engkaulah kami mohon pertolongan';
        case 5: return 'Tunjukilah kami jalan yang lurus';
        case 6: return 'Yaitu jalan orang-orang yang telah Engkau beri nikmat kepada mereka, bukan jalan mereka yang dimurkai dan bukan pula jalan mereka yang sesat';
        default: return 'Allah Yang Maha Mengetahui';
      }
    }
    return 'Dan Kami tidak mengutus engkau (Muhammad) melainkan untuk (menjadi) rahmat bagi seluruh alam.';
  }

  String _getAyahTafsir(int ayahNumber) {
    return 'Ini adalah tafsir untuk ayat $ayahNumber dari surah ${widget.surah.name}. Dalam tafsir ini dijelaskan makna mendalam dari ayat tersebut.';
  }

  void _showOptionsMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Font Size Slider
            ListTile(
              leading: const Icon(Icons.text_fields),
              title: const Text('Ukuran Font'),
              subtitle: Slider(
                value: fontSize,
                min: 16.0,
                max: 32.0,
                divisions: 8,
                label: fontSize.round().toString(),
                onChanged: (value) {
                  setState(() {
                    fontSize = value;
                  });
                },
              ),
            ),

            // Toggle Translation
            SwitchListTile(
              title: const Text('Tampilkan Terjemahan'),
              value: showTranslation,
              onChanged: (value) {
                setState(() {
                  showTranslation = value;
                });
                Navigator.pop(context);
              },
            ),

            // Toggle Tafsir
            SwitchListTile(
              title: const Text('Tampilkan Tafsir'),
              value: showTafsir,
              onChanged: (value) {
                setState(() {
                  showTafsir = value;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _bookmarkAyah(int ayahNumber) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ayat $ayahNumber telah di-bookmark'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareAyah(int ayahNumber) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membagikan ayat $ayahNumber'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _playAyah(int ayahNumber) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Memutar audio ayat $ayahNumber'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}