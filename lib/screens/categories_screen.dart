import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../items/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(category.id,category.title,category.color);
        }).toList(),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        )
      
    );
  }
}