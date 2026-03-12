import 'package:flutter_syanda/features/dosen/data/models/dosen_model.dart';

class DosenRepository {
  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy dosen
    return [
      DosenModel(
        nama: 'Anank Prasetyo',
        nip: '123456789',
        email: 'anank.prasetyo@gmail.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Rachman Sinatriya',
        nip: '987654321',
        email: 'rachman.sinatriya@gmail.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Alfian Sukma',
        nip: '456789123',
        email: 'alfian.sukma@gmail.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }
}