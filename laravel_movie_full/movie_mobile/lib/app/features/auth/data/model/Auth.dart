class Auth {
  final int id;
  final String name;
  final String image;
  final int roleId;
  final String phone;
  final String email;
  Auth({
    required this.id,
    required this.name,
    required this.image,
    required this.roleId,
    required this.phone,
    required this.email,
  });
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      roleId: json['role_id'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}