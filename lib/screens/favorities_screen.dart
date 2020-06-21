import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class FavoritiesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoritiesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
        child: Text('You have no favorities yet - start adding some!'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: favoriteMeal[idx].id,
            title: favoriteMeal[idx].title,
            imageUrl: favoriteMeal[idx].imageUrl,
            duration: favoriteMeal[idx].duration,
            affordability: favoriteMeal[idx].affordability,
            complexity: favoriteMeal[idx].complexity,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }

  }
}
