// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// TODO: Check if we need to import anything
import './category.dart';

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _buildCategoryWidget(List<Widget> categories){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index)=>categories[index],
      itemCount: categories.length,);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    final List<Category> listOfCategory = <Category>[];
    for (int i=0; i<_categoryNames.length;i++){
      listOfCategory.add(Category(name: _categoryNames[i], color: _baseColors[i], iconLocation: Icons.ac_unit));
    }
    // TODO: Create a list view of the Categories
    final listView = Container(
      color: Colors.green[100],
      padding: EdgeInsets.all(8.0),
      child: _buildCategoryWidget(listOfCategory)
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      backgroundColor: Colors.green[100],
      title: Center(
        child: Text(
        'Unit Converter',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0
        ),
        
      ))
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
