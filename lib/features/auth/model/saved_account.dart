class SavedLoginAccount {
  final String userId;
  final String name;
  final String? profileImage;

  SavedLoginAccount({
    required this.userId,
    required this.name,
    this.profileImage,
  });

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'name': name,
    'profileImage': profileImage,
  };

  factory SavedLoginAccount.fromJson(Map<String, dynamic> json) =>
      SavedLoginAccount(
        userId: json['userId'],
        name: json['name'],
        profileImage: json['profileImage'],
      );
}
