import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../items/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

  List<Meal> favouriteMeal;

  FavouritesScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeal.length ==0)
    {
      return Center(child: Text('No favourites added yet'),);
    }
    else{
      return ListView.builder(
        itemBuilder: (context,index) {
          return MealItem(
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
            id : favouriteMeal[index].id,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}