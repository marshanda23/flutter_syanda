import 'package:flutter_syanda/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaAktifModel(
        nama: 'Marshanda Hadi Susanti',
        nim: '434241072',
        email: 'marshanda.hadi@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
        status: 'Aktif',
      ),
      MahasiswaAktifModel(
        nama: 'Putri Anjani',
        nim: '2022004',
        email: 'putri.anjani@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2023',
        status: 'Aktif',
      ),
      MahasiswaAktifModel(
        nama: 'Dimas Pratama',
        nim: '2023001',
        email: 'dimas.pratama@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2023',
        status: 'Aktif',
      ),
       MahasiswaAktifModel(
        nama: 'Iwan Hadi',
        nim: '2023001',
        email: 'iwan.hadi@gmail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2023',
        status: 'Aktif',
      ),
    ];
  }
}