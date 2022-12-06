/// AppUser: to avoid conflict with User from Firebase
class AppUser {
  final String id;
  final String name;
  final String email;

  const AppUser({required this.id, required this.name, required this.email});

  factory AppUser.fromJSON(Map<String, dynamic> json) => AppUser(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
      );

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() {
    final map = toJSON();
    // adding the id
    map['id'] = id;

    return map.toString();
  }
}
