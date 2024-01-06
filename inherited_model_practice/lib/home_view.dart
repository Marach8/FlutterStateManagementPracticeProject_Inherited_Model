import 'package:flutter/material.dart';
import 'package:inherited_model_practice/color_model.dart';
import 'package:inherited_model_practice/color_widget.dart';
import 'package:inherited_model_practice/extension_enums.dart';
import 'package:inherited_model_practice/list_of_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color1 = Colors.green, color2 = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InheritedModel Example')),
      body: AvailableColorsModel(
        color1: color1, color2: color2, 
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: (){setState((){color1 = listOfColors.getRadomElement();});},
                  child: const Text('Change Color1')
                ),
                TextButton(
                  onPressed: (){setState((){color2 = listOfColors.getRadomElement();});},
                  child: const Text('Change Color2')
                )
              ]
            ),
            const ColorWidget(color: AvailableColors.one),
            const ColorWidget(color: AvailableColors.two)
          ]
        )
      )
    );
  }
}