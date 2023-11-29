import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:developer' as marach show log;


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)
      ),
      home: const HomePage(),
    );
  }
}





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







final List<MaterialColor> listOfColors = [
  Colors.blue, Colors.red, Colors.yellow, Colors.orange, 
  Colors.purple, Colors.cyan, Colors.brown, Colors.amber, Colors.deepPurple
];




enum AvailableColors{one, two}




class AvailableColorsModel extends InheritedModel<AvailableColors> {
  final MaterialColor color1, color2;
  const AvailableColorsModel({
    Key? key, required this.color1, required Widget child, required this.color2,
  }): super(key: key, child: child);
  

  static AvailableColorsModel? of(BuildContext context, AvailableColors colorAspect){
    return InheritedModel.inheritFrom<AvailableColorsModel>(context, aspect: colorAspect);
  }
  @override
  bool updateShouldNotify(covariant AvailableColorsModel oldWidget) {
    marach.log('either color1 or color2 has changed, Hence UpdateShouldNotify was called');
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }
  
  @override
  bool updateShouldNotifyDependent(covariant AvailableColorsModel oldWidget, Set<AvailableColors> dependencies) {
    if (dependencies.contains(AvailableColors.one) && color1 != oldWidget.color1) {
      marach.log('Color1 has changed'); return true;
    }
    if (dependencies.contains(AvailableColors.two) && color2 != oldWidget.color2) {
      marach.log('Color2 has changed'); return true;
    }
    return false;
  }

}






class ColorWidget extends StatelessWidget {
  final AvailableColors color;
  const ColorWidget({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    switch(color){
      case AvailableColors.one:
        marach.log('Color1 got rebuilt');
        break;
      case AvailableColors.two:
        marach.log('Color2 got rebuilt');
        break;
    }
    final colors = AvailableColorsModel.of(context, color);
    return Container(
      height: 100, color: color == AvailableColors.one? colors!.color1: colors!.color2,
    );
  }
}






extension RandomElement<T> on Iterable<T> {
  T getRadomElement() => elementAt(Random().nextInt(length));
}