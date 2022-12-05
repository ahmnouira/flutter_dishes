import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/data/dishes.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/loading_widget.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  static const routeName = 'dishes';

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  bool _isLoading = true;

  List<Dish> _list = [];

  Future getData() async {
    setState(() {
      _list = dishes;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dishes'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favoritesPage);
            },
            icon: const Icon(Icons.favorite_sharp),
          ),
        ],
      ),
      body: _isLoading
          ? const LoadingWidget()
          : RefreshIndicator(
              onRefresh: getData,
              child: DishListViewWidget(
                list: _list,
                onToggleFavorite: (Dish item) {},
                dishListContext: DishListContext.user,
              ),
            ),
    );
  }
}
