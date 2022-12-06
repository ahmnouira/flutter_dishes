import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/services/favorite_service.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_widget.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  static const routeName = 'dishes';

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  late final Stream<QuerySnapshot<Object?>>? _stream;

  final pageWidget = PageWidget();

  String _getRouteArgument(String key) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return routeArguments[key] as String;
  }

  Future<void> getData() async {
    final dishServices = DishService();
    setState(() {
      _stream = dishServices.getAll();
    });
  }

  void onToggleFavorite(Dish dish) {
    final favoriteService = FavoriteService();
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
      appBar: pageWidget.buildAppBar(context, 'User Dishes', PageContext.user),
      body: DishListViewWidget(
        stream: _stream,
        onToggleFavorite: onToggleFavorite,
        dishListContext: DishListContext.user,
        onRefresh: getData,
      ),
    );
  }
}
