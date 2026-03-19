class MahasiswaModel {
  final int postId;
  final int id;
  final String nama;   
  final String nim;    
  final String email;
  final String jurusan; 
  final String angkatan; 
  final String body;

  MahasiswaModel({
    required this.postId,
    required this.id,
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.angkatan,
    required this.body,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      postId: json['postId'] ?? 0,
      id: json['id'] ?? 0,
      nama: json['name'] ?? '',
      nim: '${json['id'] ?? 0}'.padLeft(9, '0'),
      email: json['email'] ?? '',
      jurusan: 'Teknik Informatika',
      angkatan: '2024',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': nama,
      'email': email,
      'body': body,
    };
  }
}