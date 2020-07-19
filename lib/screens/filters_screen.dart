import 'dart:ui';

import 'package:flutter/material.dart';
import '../main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters-screen';
  
  final Map<String,bool> currentFilters;
  final Function updateMeal;

  FiltersScreen(this.currentFilters,this.updateMeal);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget buildSwitchList(String title,String description,bool currValue,Function updateValue)
  {
    return SwitchListTile(
      value: currValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton( 
            icon : Icon(Icons.save),
            onPressed: ()  {
                final newFilters = {
                  'gluten' : _glutenFree,
                  'lactose' : _lactoseFree,
                 'vegan' : _vegan,
                  'vegetarian' : _vegetarian,
                };
                widget.updateMeal(newFilters);
            }
            ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(30),
          child : Text('Add Filters ...',style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Container(
          child : buildSwitchList(
            'Gluten-Free',
            'Include gluten-free meals only',
            _glutenFree,
             (newValue) {
              setState(() {
              _glutenFree= newValue;
            });
          },
          ),
        ),
        Container(
          child : buildSwitchList(
            'Lactose-Free',
            'Include lactose-free meals only',
            _lactoseFree,
             (newValue) {
              setState(() {
              _lactoseFree= newValue;
            });
          },
          ),
        ),
        Container(
          child : buildSwitchList(
            'Vegan',
            'Include vegan meals only',
            _vegan,
             (newValue) {
              setState(() {
              _vegan= newValue;
            });
          },
          ),
        ),
        Container(
          child : buildSwitchList(
            'vegetarian',
            'Include vegetarian meals only',
            _vegetarian,
            (newValue) {
              setState(() {
              _vegetarian= newValue;
            });
          },
          ),
        ),
        
      ],)
    );
  }
}