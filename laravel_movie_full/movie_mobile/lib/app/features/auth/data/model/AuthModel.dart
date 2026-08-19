class Auth {
  final int id;
  final String name;
  final String image;
  final int roleId;
  final String phone;
  final String email;
  final String token;

  Auth({
    required this.id,
    required this.name,
    required this.image,
    required this.roleId,
    required this.phone,
    required this.email,
    required this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return Auth(
      id: data['id'] as int,
      name: data['name'] as String,
      image: data['image'] as String,
      roleId: data['role_id'] as int,
      phone: data['phone'] as String,
      email: data['email'] as String,
      token: json['token'] as String,
    );
  }

  @override
  String toString() {
    return 'Auth(id: $id, name: $name, roleId: $roleId, phone: $phone, email: $email, token: $token)';
  }
}
