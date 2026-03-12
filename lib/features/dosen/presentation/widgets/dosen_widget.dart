import 'package:flutter/material.dart';
import '../../data/models/dosen_model.dart';

class DosenListView extends StatelessWidget {
  final List<DosenModel> dosenList;
  final VoidCallback? onRefresh;
  final bool useModernCard;

  const DosenListView({
    super.key,
    required this.dosenList,
    this.onRefresh,
    this.useModernCard = true,
  });

  @override
  Widget build(BuildContext context) {
    if (dosenList.isEmpty) {
      return const Center(
        child: Text('Tidak ada data dosen'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dosenList.length,
        itemBuilder: (context, index) {
          final dosen = dosenList[index];
          return ModernDosenCard(dosen: dosen);
        },
      ),
    );
  }
}

class ModernDosenCard extends StatelessWidget {
  final DosenModel dosen;

  const ModernDosenCard({super.key, required this.dosen});

  // Warna gradient berbeda tiap huruf
  List<Color> _getGradientColors(String name) {
    final gradients = [
      [const Color(0xFF667eea), const Color(0xFF764ba2)],
      [const Color(0xFFf093fb), const Color(0xFFf5576c)],
      [const Color(0xFF4facfe), const Color(0xFF00f2fe)],
      [const Color(0xFF43e97b), const Color(0xFF38f9d7)],
      [const Color(0xFFfa709a), const Color(0xFFfee140)],
    ];
    final index = name.isNotEmpty ? name.codeUnitAt(0) % gradients.length : 0;
    return gradients[index];
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = _getGradientColors(dosen.nama);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar dengan gradient
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  dosen.nama.isNotEmpty ? dosen.nama[0].toUpperCase() : 'D',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dosen.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.badge_outlined, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        'NIP: ${dosen.nip}',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.email_outlined, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          dosen.email,
                          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.school_outlined, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        dosen.jurusan,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Arrow icon
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: gradientColors[0].withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.chevron_right_rounded,
                color: gradientColors[0],
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleDosenCard extends StatelessWidget {
  final DosenModel dosen;

  const SimpleDosenCard({super.key, required this.dosen});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            dosen.nama.isNotEmpty ? dosen.nama[0].toUpperCase() : 'D',
          ),
        ),
        title: Text(dosen.nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIP: ${dosen.nip}'),
            Text(dosen.email),
            Text(dosen.jurusan),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}