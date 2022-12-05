class Dish {
  // id
  final int id;
  final String name;

  const Dish({required this.id, required this.name});

  factory Dish.fromJSON(Map<String, dynamic> json) =>
      Dish(id: json['id'] as int, name: json['name'] as String);

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return toJSON().toString();
  }
}
