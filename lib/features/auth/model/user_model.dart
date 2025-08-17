import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? fullName;
  final String? gender;
  final String? birthday;
  final String? profileImage;
  final DateTime? createdat;

  const UserModel({
    this.id,
    this.email,
    this.password,
    this.fullName,
    this.gender,
    this.birthday,
    this.profileImage,
    this.createdat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    fullName: json['fullname'] as String?,
    gender: json['gender'] as String?,
    birthday: json['birthday'] as String?,
    profileImage: json['avatar_url'] as String?,
    createdat: json['createdat'] != null
        ? DateTime.tryParse(json['createdat'])
        : null,
  );
  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? fullName,
    String? gender,
    String? birthday,
    String? profileImage,
    DateTime? createdat,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      profileImage: profileImage ?? this.profileImage,
      createdat: createdat ?? this.createdat,
    );
  }

  @override
  String toString() =>
      'UserModel(id: $id, email: $email, password: $password, fullName: $fullName, gender: $gender, birthday: $birthday, profileImage: $profileImage, createdat: $createdat)';

  Map<String, dynamic> toJson() => {
    'email': email,
    'fullname': fullName,
    'gender': gender,
    'birthday': birthday,
    'avatar_url': profileImage,
  };

  @override
  List<Object?> get props => [
    id,
    email,
    password,
    fullName,
    gender,
    birthday,
    profileImage,
    createdat,
  ];
}
