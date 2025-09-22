import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class FeaturedClassCard extends StatelessWidget {
  const FeaturedClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Increased height to accommodate content
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFF6B6B),
            Color(0xFFFF8E8E),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B6B).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          onTap: () {
            // Handle featured class tap
          },
          child: Stack(
            children: [
              // Background Pattern
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 100, // Reduced size
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                bottom: -25,
                child: Container(
                  width: 60, // Reduced size
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              
              // Content
              Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Added this to prevent overflow
                  children: [
                    // Trending badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4, // Reduced padding
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '🔥 Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11, // Slightly smaller
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 8), // Reduced spacing
                    
                    // Title
                    const Text(
                      'Tahsin Al-Quran\nUntuk Pemula',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18, // Slightly smaller
                        fontWeight: FontWeight.bold,
                        height: 1.2, // Reduced line height
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 6), // Reduced spacing
                    
                    // Description
                    Flexible( // Made flexible to prevent overflow
                      child: Text(
                        'Belajar membaca Al-Quran dengan tajwid yang benar',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13, // Slightly smaller
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    const SizedBox(height: 12), // Reduced spacing
                    
                    // Stats row
                    Row(
                      children: [
                        Icon(
                          Icons.people_rounded,
                          color: Colors.white.withOpacity(0.9),
                          size: 14, // Slightly smaller
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '1,234 siswa',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 11, // Slightly smaller
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.yellow.shade300,
                          size: 14, // Slightly smaller
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 11, // Slightly smaller
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        // Join button
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Gabung',
                            style: TextStyle(
                              color: Color(0xFFFF6B6B),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}