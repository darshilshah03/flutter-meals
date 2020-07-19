import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite,this.isFavourite);

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments as Map<String,String>;

    final id = args['id'];
    final mealDetails = DUMMY_MEALS.firstWhere((meal)  {
      return meal.id == id ;
    }) ;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              mealDetails.imageUrl,
              fit: BoxFit.cover,
            ),
            
          ),
           
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Ingredients',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          Container(
            height: 150,
            width : 300,
            decoration: BoxDecoration(
              
              border: Border.all(color: Colors.black,width:2),
            ),
            child: ListView.builder(
              itemBuilder: (context,index) => Card(
                color: Colors.black87,
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(7),
                  child: Text(mealDetails.ingredients[index],style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),),
                ),
              ),
              itemCount: mealDetails.ingredients.length,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Steps',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color : Colors.black,
                width: 2
                ),
            ),
            child: ListView.builder(
             itemBuilder: (context,index) => Column(
               children: <Widget>[
                 ListTile(
                   leading: CircleAvatar(
                     child: Text('${index+1}'),
                   ),
                   title: Text(mealDetails.steps[index]),
                 ),
                 Divider(
                   color: Colors.black,
                   height: 1,
                 )
               ],
             ),
             itemCount: mealDetails.steps.length, 
            )
          ),
         
        ],),
      ),
      floatingActionButton:  FloatingActionButton(
          child : Icon(
            isFavourite(id) ? Icons.star : Icons.star_border
          ),
          onPressed: () => toggleFavourite(id)
        ),
    );
  }
}