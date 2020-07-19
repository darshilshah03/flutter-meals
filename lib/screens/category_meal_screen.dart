import 'package:flutter/material.dart';
import '../items/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  final List <Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments as Map<String,String>;

    final String id = args['id'];
    final String title = args['title'];

    final categoryMeal = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context,index) {
          return MealItem(
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            duration: categoryMeal[index].duration,
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            id : categoryMeal[index].id,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}