class DoctorModel {
  String? doctorimg;
  String? expcerft;
  final String? name;
  final String? phone;
  final String? gender;
  final String? birthday;
  final String? email;
  final String? password;
  final String? id;

  DoctorModel({
    required this.doctorimg,
    this.expcerft,
    required this.name,
    required this.phone,
    required this.gender,
    required this.birthday,
    required this.email,
    required this.password,
    required this.id,
  });

  // Factory constructor to create UserModel from JSON data
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorimg: json['doctorimg'],
      expcerft: json['expcerft'],
      name: json['name'],
      phone: json['phone'],
      gender: json['gender'],
      birthday: json['birthday'],
      email: json['email'],
      password: json['password'],
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'doctorimg': doctorimg,
      'expcerft': expcerft,
      'name': name,
      'phone': phone,
      'gender': gender,
      'birthday': birthday,
      'email': email,
      'password': password,
      'id': id,
    };
  }
}
