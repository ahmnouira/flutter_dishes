import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';

class UserDishListWidget extends StatelessWidget {
  final List<Dish> list;

  final void Function(Dish item) onToggleFavorite;

  const UserDishListWidget({
    super.key,
    required this.list,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.symmetric(vertical: Breakpoint.x05),
      itemBuilder: (context, index) {
        final item = list[index];

        return ListTile(
          key: Key(item.name),
          title: Text(item.name),
          trailing: Wrap(
            spacing: -16.0,
            children: [
              IconButton(
                onPressed: () {
                  onToggleFavorite(item);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
