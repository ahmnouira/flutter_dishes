class Dish {
  //
  final String name;

  const Dish({required this.name});

  factory Dish.fromJSON(Map<String, dynamic> json) =>
      Dish(name: json['name'] as String);

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return toJSON().toString();
  }
}
