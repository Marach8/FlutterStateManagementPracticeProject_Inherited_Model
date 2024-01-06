import 'package:flutter/material.dart';
import 'package:inherited_model_practice/extension_enums.dart';
import 'dart:developer' as marach show log;

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
      marach.log('Color1 has changed'); 
      return true;
    }
    if (dependencies.contains(AvailableColors.two) && color2 != oldWidget.color2) {
      marach.log('Color2 has changed'); 
      return true;
    }
    return false;
  }
}