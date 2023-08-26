class User {
  final String? id;
  final String firstName;
  String? lastName;
  final String? phoneNumber;
  final String? email;
  final bool? isAdmin;
  final bool? isVerified;
  final String? addressId;
  final String? avatarUrl;
  User({
    this.id,
    required this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.isAdmin,
    this.isVerified,
    this.addressId,
    this.avatarUrl,
  });

  static final guestUser = User(
    firstName: 'Guest',
    lastName: '',
    avatarUrl:
        'https://xcobkrczeidtzovbhism.supabase.co/storage/v1/object/public/avatars/guest?t=2023-08-25T20%3A48%3A26.731Z',
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']! as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      isVerified: json['isVerified'] as bool,
      avatarUrl: json['avatarUrl'] as String,
    );
  }
}
