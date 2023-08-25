class User {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final bool isAdmin;
  final bool isVerified;
  final String? addressId;
  final String? avatarUrl;
  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.isAdmin,
    required this.isVerified,
    this.addressId,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']! as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      isVerified: json['isVerified'] as bool,
      addressId: json['addressId'],
      avatarUrl: json['avatarUrl']! as String,
    );
  }
}
