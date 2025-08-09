import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';


extension CalculatorItemExtension on CalculatorItemsEnum {
  Widget icon([Color? color]) {
    switch (this) {
      case CalculatorItemsEnum.ADD:
        return Icon(Icons.add, size: 20, color: color);
      case CalculatorItemsEnum.SUBTRACT:
        return Icon(Icons.remove, size: 20, color: color);
      case CalculatorItemsEnum.MULTIPLY:
        return Icon(Icons.close, size: 20, color: color);
      case CalculatorItemsEnum.DIVIDE:
        return Center(
          child: Text(
            "÷",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 0,
              fontSize: 25,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      case CalculatorItemsEnum.CLEAR:
        return Icon(Icons.cleaning_services, color: color);
      case CalculatorItemsEnum.BACKSPACE:
        return Icon(Icons.backspace, color: color);
      case CalculatorItemsEnum.OPEN_PARENTHESIS:
        return Center(
          child: Text(
            "(",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 0,
              fontSize: 25,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      case CalculatorItemsEnum.CLOSE_PARENTHESIS:
        return Center(
          child: Text(
            ")",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 0,
              fontSize: 25,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      case CalculatorItemsEnum.TRANSPARENT:
        return Container();
    }
  }

  String get name {
    switch (this) {
      case CalculatorItemsEnum.ADD:
        return "+";
      case CalculatorItemsEnum.SUBTRACT:
        return "-";
      case CalculatorItemsEnum.MULTIPLY:
        return "x";
      case CalculatorItemsEnum.DIVIDE:
        return "÷";
      case CalculatorItemsEnum.CLEAR:
        return "";
      case CalculatorItemsEnum.BACKSPACE:
        return "";
      case CalculatorItemsEnum.OPEN_PARENTHESIS:
        return "(";
      case CalculatorItemsEnum.CLOSE_PARENTHESIS:
        return ")";
      case CalculatorItemsEnum.TRANSPARENT:
        return "";
    }
  }

    num?  operator(num n1, num n2) {
    switch (this) {
      case CalculatorItemsEnum.ADD:
        return n1 + n2;
      case CalculatorItemsEnum.SUBTRACT:
        return n1 - n2;
      case CalculatorItemsEnum.MULTIPLY:
        return n1 * n2;
      case CalculatorItemsEnum.DIVIDE:
        return n1 / n2;
      case CalculatorItemsEnum.CLEAR:
        return null;
      case CalculatorItemsEnum.BACKSPACE:
        return null;
      case CalculatorItemsEnum.OPEN_PARENTHESIS:
        return null;
      case CalculatorItemsEnum.CLOSE_PARENTHESIS:
        return null;
      case CalculatorItemsEnum.TRANSPARENT:
        return null;
    }
  }
}
