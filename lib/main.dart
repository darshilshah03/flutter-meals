import 'package:flutter/material.dart';
import './screens/category_meal_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map <String,bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void updateMeal (Map<String,bool> newData) {
    setState(() {
      _filters = newData;
      print(_filters);

      availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree)
        {
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree)
        {
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan)
        {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian)
        {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String id)
  {
    var index = favouriteMeals.indexWhere((meal){
      return meal.id == id;
    });
    if(index==-1)
    {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) {
          return meal.id == id;
        }));
      });
    }
    else{
      setState(() {
        favouriteMeals.removeAt(index);
      });
    }
  }

  bool isFavourite(String id)
  {
    return favouriteMeals.any((meal) {
      return meal.id == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.purple
      ),
      routes: {
        '/' : (ctx) => TabsScreen(favouriteMeals),
        CategoryMealScreen.routeName : (ctx) => CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(toggleFavourite,isFavourite),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_filters,updateMeal),
      }
    );
  }
}

