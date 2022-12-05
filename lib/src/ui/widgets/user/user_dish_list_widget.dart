import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';

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
    return DishListViewWidget(
      list: list,
      dishListContext: DishListContext.user,
    );
  }
}
