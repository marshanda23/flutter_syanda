class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'] ?? '',
      suite: json['suite'] ?? '',
      city: json['city'] ?? '',
      zipcode: json['zipcode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
    };
  }
}

class DosenModel {
  final int id;
  final String nama;   
  final String nip;    
  final String email;
  final String jurusan; // 'address.city'
  final AddressModel address;

  DosenModel({
    required this.id,
    required this.nama,
    required this.nip,
    required this.email,
    required this.jurusan,
    required this.address,
  });

  factory DosenModel.fromJson(Map<String, dynamic> json) {
    final address = AddressModel.fromJson(json['address'] ?? {});
    return DosenModel(
      id: json['id'] ?? 0,
      nama: json['name'] ?? '',
      nip: json['username'] ?? '',
      email: json['email'] ?? '',
      jurusan: address.city,
      address: address,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': nama,
      'username': nip,
      'email': email,
      'address': address.toJson(),
    };
  }
}