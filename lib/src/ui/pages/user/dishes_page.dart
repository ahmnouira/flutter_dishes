import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/favorite_service.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  static const routeName = 'dishes';

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  late final Stream<QuerySnapshot<Object?>>? _stream;

  final favoriteService = FavoriteService();

  String _getRouteArgument(String key) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return routeArguments[key] as String;
  }

  Future<void> getData() async {
    final uid = _getRouteArgument('uid');
    setState(() {
      _stream = favoriteService.getAll(uid);
    });
  }

  void onToggleFavorite(Dish dish) {
    final uid = _getRouteArgument('uid');
    favoriteService.toggle(uid, dish);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dishes'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout_outlined)),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favoritesPage);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: DishListViewWidget(
        stream: _stream,
        onToggleFavorite: onToggleFavorite,
        dishListContext: DishListContext.user,
        onRefresh: getData,
      ),
    );
  }
}
