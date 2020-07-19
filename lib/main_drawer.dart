import 'package:flutter/material.dart';
import './screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(20),
          height: 150,
          width: double.infinity,
          child: Text('Welcome!!',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          leading: Icon(Icons.restaurant,size: 28,),
          title: Text('Restaurant',style: TextStyle(
            fontSize: 25,
            fontWeight : FontWeight.bold
          ),),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
          leading: Icon(Icons.settings,size: 28,),
          title: Text('Settings',style: TextStyle(
            fontSize: 25,
            fontWeight : FontWeight.bold
          ),),
        ),
      ],),
    );
  }
}