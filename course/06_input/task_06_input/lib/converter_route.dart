// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the color and units to not be null.
  const ConverterRoute({
    @required this.color,
    @required this.units,
  })  : assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  String _fromUnit;
  String _toUnit;

  @override
  initState(){
    super.initState();
    _fromUnit = widget.units[0].name;
    _toUnit = widget.units[0].name;
  }
  // TODO: Determine whether you need to override anything, such as initState()

  // TODO: Add other helper functions. We've given you one, _format()

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that
    // includes the input value, and 'from' unit [Dropdown].
    
   final input = Padding(
     padding: _padding,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              style: Theme.of(context).textTheme.display1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.0)
                ),
                labelStyle: Theme.of(context).textTheme.display1,
                labelText : 'Input'
              ),
              keyboardType: TextInputType.number,
              //onChanged: (){print('i was tapped')},
            ),
            Container(
              margin: EdgeInsets.only(top:16.0),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border.all(
                  color:Colors.grey[400],
                  width:1.0
                ), 
              ),
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor:Colors.grey[50]),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _fromUnit,
                      onChanged: (value) => {
                        setState((){
                          _fromUnit = value;
                        })
                      },
                      items: widget.units.map((Unit unit) => 
                        DropdownMenuItem<String>(
                          value : unit.name,
                          child:new Text(unit.name),
                        )
                      ).toList(),
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
              )
            )
          ],
        )
   );

    // TODO: Create a compare arrows icon.
    var compareArrow = RotatedBox(quarterTurns: 1,
    child: Icon(Icons.compare_arrows,size:40.0));


    // TODO: Create the 'output' group of widgets. This is a Column that
    // includes the output value, and 'to' unit [Dropdown].
    var output = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.display1,
              labelText: 'Output',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0))
            ),
            keyboardType: TextInputType.number,
          ),
          Container(
              margin: EdgeInsets.only(top:16.0),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border.all(
                  color:Colors.grey[400],
                  width:1.0
                ), 
              ),
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor:Colors.grey[50]),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _toUnit,
                      onChanged: (value) => {
                        setState((){
                          _toUnit = value;
                        })
                      },
                      items: widget.units.map((Unit unit) => 
                        DropdownMenuItem<String>(
                          value : unit.name,
                          child:new Text(unit.name),
                        )
                      ).toList(),
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
              )
            )
          
        ]
      ),);

    // TODO: Return the input, arrows, and output widgets, wrapped in a Column.
    final unitWidget = Column(
      children:[
        input,
        compareArrow,
        output,
      ]
    );

    // // TODO: Delete the below placeholder code.
    // final unitWidgets = widget.units.map((Unit unit) {
    //   return Container(
    //     color: widget.color,
    //     margin: EdgeInsets.all(8.0),
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       children: <Widget>[
    //         Text(
    //           unit.name,
    //           style: Theme.of(context).textTheme.headline,
    //         ),
    //         Text(
    //           'Conversion: ${unit.conversion}',
    //           style: Theme.of(context).textTheme.subhead,
    //         ),
    //       ],
    //     ),
    //   );
    // }).toList();

    return Container(
      padding: _padding,
      child: unitWidget
    );
  }
}
