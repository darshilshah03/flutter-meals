import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;
  MealItem({
    this.title,
    this.affordability,
    this.complexity,
    this.duration,
    this.imageUrl,
    this.id
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: {'id' : id},
    ).then((result) => {
      if(result!=null)
      {
        print(result)
      }
    });
  }

  String get complexityText {
    if(complexity == Complexity.Simple)
      return 'Simple';
    else if (complexity == Complexity.Challenging)
      return 'Challenging';
    else
      return 'Hard';
  }

  String get affordabilityText {
    if(affordability == Affordability.Affordable)
      return 'Affordable';
    else if (affordability == Affordability.Luxurious)
      return 'Luxurious';
    else
      return 'Pricey';
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap : () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width : double.infinity,
                  fit : BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 250,
                  color: Colors.black45,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.schedule),
                Text('$duration min   '),
              ],),
              Row(children: <Widget>[
                Icon(Icons.work),
                Text(complexityText),
              ],),
              Row(children: <Widget>[
                Icon(Icons.attach_money),
                Text(affordabilityText),
              ],),
              
            ],),
          ),
        
        ],),
      ),
    );
  }
}