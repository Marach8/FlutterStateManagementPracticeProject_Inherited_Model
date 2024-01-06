import 'package:flutter/material.dart';
import 'package:inherited_model_practice/color_model.dart';
import 'package:inherited_model_practice/extension_enums.dart';

class ColorWidget extends StatelessWidget {
  final AvailableColors color;
  const ColorWidget({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    // switch(color){
    //   case AvailableColors.one:
    //     marach.log('Color1 got rebuilt');
    //     break;
    //   case AvailableColors.two:
    //     marach.log('Color2 got rebuilt');
    //     break;
    // }
    final colors = AvailableColorsModel.of(context, color);
    return Container(
      height: 100, color: color == AvailableColors.one? colors!.color1: colors!.color2,
    );
  }
}