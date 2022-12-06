import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/auth_service.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_widget.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  static const routeName = 'dishes';

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  final pageWidget = PageWidget();
  final authService = AuthService();

  Future<void> onToggleFavorite(Dish dish) async {
    final dishService = DishService();
    dishService.toggle(authService.uid.toString(), dish.id);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dishServices = DishService();

    return Scaffold(
      appBar: pageWidget.buildAppBar(context, 'User Dishes', PageContext.user),
      body: DishListViewWidget(
        uid: authService.uid.toString(),
        stream: dishServices.getAll(),
        onToggleFavorite: (item) {
          onToggleFavorite(item).then((_) {
            // snackBar(context, content: '${item.name} saved.');
          });
        },
        dishListContext: DishListContext.user,
        onRefresh: () async {},
      ),
    );
  }
}
