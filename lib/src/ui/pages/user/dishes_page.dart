import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/auth_service.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/services/favorite_service.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_widget.dart';
import 'package:flutter_dishes/src/utils/timer.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  static const routeName = 'dishes';

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  List<String> favorites = [];

  final pageWidget = PageWidget();
  final authService = AuthService();
  final favoriteService = FavoriteService();

  void _getFavorites() {
    favoriteService.getAllOnceByUid(authService.uid.toString()).then((data) {
      setState(() {
        favorites = data.map((e) => e.id).toList();
      });
    });
  }

  Future<void> onToggleFavorite(Dish dish) async {
    favoriteService.toggle(authService.uid.toString(), dish);
    print('favorites $favorites');
    _getFavorites();
  }

  @override
  void initState() {
    super.initState();

    _getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final dishServices = DishService();

    print('build $favorites');

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
        favorites: favorites,
        dishListContext: DishListContext.user,
        onRefresh: () async {},
      ),
    );
  }
}
