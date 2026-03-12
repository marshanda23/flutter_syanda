import 'package:flutter_syanda/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaModel(
        nama: 'Marshanda Hadi Susanti',
        nim: '434241072',
        email: 'marshanda.hadi@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
      ),
      MahasiswaModel(
        nama: 'Febby arsyana',
        nim: '2021002',
        email: 'febby.arsyana@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2023',
      ),
      MahasiswaModel(
        nama: 'Ahmad Fauzi',
        nim: '2022001',
        email: 'ahmad.fauzi@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2023',
      ),
      MahasiswaModel(
        nama: 'Bintang Gana',
        nim: '2022002',
        email: 'bintang.gana@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
      ),
      MahasiswaModel(
        nama: 'Bella Rahma',
        nim: '2022002',
        email: 'bella.rahma@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
      ),
      MahasiswaModel(
        nama: 'Dewi Lestari',
        nim: '2022002',
        email: 'dewi.lestari@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
      ),
    ];
  }
}