class MahasiswaAktifModel {
  final int userId;
  final int id;
  final String nama;    
  final String nim;     
  final String email;   
  final String jurusan; 
  final String angkatan; 
  final String status;  
  final String body;

  MahasiswaAktifModel({
    required this.userId,
    required this.id,
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.angkatan,
    required this.status,
    required this.body,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      nama: json['title'] ?? '',
      nim: '${json['id'] ?? 0}'.padLeft(9, '0'),
      email: 'mahasiswa${json['id']}@univ.ac.id',
      jurusan: 'Teknik Informatika',
      angkatan: '2024',
      status: 'Aktif',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': nama,
      'body': body,
    };
  }
}