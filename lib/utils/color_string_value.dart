import 'dart:ui';
import 'package:color_models/color_models.dart';

String colorValue(String colorValue,int index){
  Color valueColor = Color(int.parse('FF$colorValue', radix: 16));
  RgbColor color = RgbColor(valueColor.red,valueColor.green,valueColor.blue);
  switch(index){
    case 0:
      return 'RGB(${color.red},${color.green},${color.blue})';
    case 1:
      return valueColor.value.toRadixString(16);
    case 2:
      var newColorValue = HsbColor.from(color);
      return 'HSB(${newColorValue.hue.floor()},${newColorValue.saturation.floor()},${newColorValue.brightness.floor()})';
    case 3:
      var newColorValue = HslColor.from(color);
      return'HSL(${newColorValue.hue.floor()},${newColorValue.saturation.floor()},${newColorValue.lightness.floor()})';
    case 4:
      var newColorValue = CmykColor.from(color);
      return 'CMYK(${newColorValue.cyan.floor()},${newColorValue.magenta.floor()},${newColorValue.yellow.floor()},${newColorValue.black.floor()})';
    case 5:
      var newColorValue = LabColor.from(color);
      return 'LAB(${newColorValue.lightness.floor()},${newColorValue.a.floor()},${newColorValue.b.floor()})';
    case 6:
    //Xyz
      var newColorValue = XyzColor.from(color);
      return 'XYZ(${newColorValue.x.floor()},${newColorValue.y.floor()},${newColorValue.z.floor()})';
    case 7:
      var newColorValue =HspColor.from(color);
      return 'HSP(${newColorValue.hue.floor()},${newColorValue.saturation.floor()},${newColorValue.perceivedBrightness.floor()})';
  }
  return '';
}
//
//bool checkBrightness(){}