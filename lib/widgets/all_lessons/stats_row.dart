import 'package:flutter/material.dart';
import '../../models/materi_model.dart';
import '../../utils/materi_filter_helper.dart';

class StatsRow extends StatelessWidget {
  final List<Materi> materiList;

  const StatsRow({
    super.key,
    required this.materiList,
  });

  @override
  Widget build(BuildContext context) {
    final stats = MateriFilterHelper.getStats(materiList);
    
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildStatItem(
            'Total', 
            stats['total'].toString(), 
            Colors.blue
          ),
          const SizedBox(width: 20),
          _buildStatItem(
            'Selesai', 
            stats['completed'].toString(), 
            Colors.green
          ),
          const SizedBox(width: 20),
          _buildStatItem(
            'Berlangsung', 
            stats['inProgress'].toString(), 
            Colors.orange
          ),
        ],
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
}