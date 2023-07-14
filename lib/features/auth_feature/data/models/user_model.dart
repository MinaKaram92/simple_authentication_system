import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String phone;

  const UserModel(
      {required this.name, required this.email, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(email: json['email'], name: json['name'], phone: json['phone']);

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'phone': phone,
      };

  @override
  List<Object?> get props => [name, email, phone];
}
