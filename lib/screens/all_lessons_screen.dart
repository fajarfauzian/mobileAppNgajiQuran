import 'package:flutter/material.dart';
import '../models/materi_model.dart';
import '../data/materi_data.dart';
import 'materi_detail_screen.dart';

class AllLessonsScreen extends StatefulWidget {
  const AllLessonsScreen({super.key});

  @override
  State<AllLessonsScreen> createState() => _AllLessonsScreenState();
}

class _AllLessonsScreenState extends State<AllLessonsScreen> {
  String selectedCategory = 'Semua';
  
  List<Materi> getFilteredMateri() {
    if (selectedCategory == 'Semua') {
      List<Materi> allMateri = List.from(dummyMateri);
      allMateri.sort((a, b) {
        if (a.progressValue == 1.0 && b.progressValue != 1.0) return -1;
        if (b.progressValue == 1.0 && a.progressValue != 1.0) return 1;
        if (a.progressValue > 0 && b.progressValue == 0) return -1;
        if (b.progressValue > 0 && a.progressValue == 0) return 1;
        return a.id.compareTo(b.id);
      });
      return allMateri;
    }
    return dummyMateri.where((materi) => materi.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMateri = getFilteredMateri();
    
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Semua Pelajaran',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Filter
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: _buildCategoryButton('Semua')),
                const SizedBox(width: 12),
                Expanded(child: _buildCategoryButton('Pra Tahsin')),
                const SizedBox(width: 12),
                Expanded(child: _buildCategoryButton('Tahsin')),
              ],
            ),
          ),
          
          // Stats Row
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _buildStatItem('Total', dummyMateri.length.toString(), Colors.blue),
                const SizedBox(width: 20),
                _buildStatItem('Selesai', dummyMateri.where((m) => m.progressValue == 1.0).length.toString(), Colors.green),
                const SizedBox(width: 20),
                _buildStatItem('Berlangsung', dummyMateri.where((m) => m.progressValue > 0 && m.progressValue < 1.0).length.toString(), Colors.orange),
              ],
            ),
          ),
          
          const Divider(height: 1),
          
          // Lessons List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredMateri.length,
              itemBuilder: (context, index) {
                final materi = filteredMateri[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildLessonItem(materi),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCategoryButton(String category) {
    final isSelected = selectedCategory == category;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
          ),
        ),
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
  
  Widget _buildLessonItem(Materi materi) {
    Color statusColor;
    String statusText;
    IconData statusIcon;
    
    if (materi.progressValue == 1.0) {
      statusColor = Colors.green;
      statusText = 'Selesai';
      statusIcon = Icons.check_circle;
    } else if (materi.progressValue > 0) {
      statusColor = Colors.orange;
      statusText = 'Berlangsung';
      statusIcon = Icons.play_circle;
    } else {
      statusColor = Colors.grey;
      statusText = 'Belum Mulai';
      statusIcon = Icons.circle_outlined;
    }
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MateriDetailScreen(materi: materi),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Status Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                  size: 24,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        materi.badgeText,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Title
                    Text(
                      materi.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    // Category
                    Text(
                      materi.category,
                      style: TextStyle(
                        color: materi.category == 'Pra Tahsin' 
                            ? Colors.orange.shade700 
                            : Colors.blue.shade700,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Progress
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: materi.progressValue,
                            backgroundColor: Colors.grey.shade300,
                            color: statusColor,
                            minHeight: 6,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          materi.progressText,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Status
              Column(
                children: [
                  Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  if (materi.progressValue > 0 && materi.progressValue < 1.0)
                    Text(
                      '${(materi.progressValue * 100).round()}%',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}