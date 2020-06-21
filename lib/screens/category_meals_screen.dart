import 'package:flutter/material.dart';
import 'package:mealapp/widgets/meal_item.dart';
import '../models/meal.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId;
  String categoryTitle ;
  List<Meal> displayedMeals;

  bool _loadedInitData = false;

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_loadedInitData == false){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];

      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: displayedMeals[idx].id,
            title: displayedMeals[idx].title,
            imageUrl: displayedMeals[idx].imageUrl,
            duration: displayedMeals[idx].duration,
            affordability: displayedMeals[idx].affordability,
            complexity: displayedMeals[idx].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
