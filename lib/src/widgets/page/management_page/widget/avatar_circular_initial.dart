import 'package:flutter/material.dart';

enum AvatarBackgroundColor {
  PRIMARY,
  SOFT_GREEN,
  SOFT_BLUE,
  HARD_GREEN,
  HARD_BLUE,
}

enum AvatarFrontColor {
  HARD_GREEN,
  HARD_BLUE,
  WHITE,
}

class AvatarCircularInitial extends StatelessWidget {
  const AvatarCircularInitial({
    super.key,
    required this.name,
    this.size = 50,
    this.backgroundColor = AvatarBackgroundColor.PRIMARY,
    this.frontColor = AvatarFrontColor.WHITE,
  });

  final String name;
  final double size;
  final AvatarBackgroundColor backgroundColor;
  final AvatarFrontColor frontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: CircleAvatar(
        radius: size,
        backgroundColor: _getBgColorFromEnum(backgroundColor),
        child: Text(name,
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: _getFrontColorFromEnum(frontColor))),
      ),
    );
  }
}

_getBgColorFromEnum(AvatarBackgroundColor color) {
  switch (color) {
    case AvatarBackgroundColor.SOFT_GREEN:
      return Color(0xFFD6F7DA);
    case AvatarBackgroundColor.SOFT_BLUE:
      return Color(0xFFCBEEF3);
    case AvatarBackgroundColor.HARD_GREEN:
      return Color(0xFF4CAF50);
    case AvatarBackgroundColor.HARD_BLUE:
      return Color(0xFFB8C3E8);
    case AvatarBackgroundColor.PRIMARY:
      return Color(0xFF1E5C8B);
    default:
      return Color(0xFFCBEEF3);
  }
}

_getFrontColorFromEnum(AvatarFrontColor color) {
  switch (color) {
    case AvatarFrontColor.HARD_GREEN:
      return Color(0xFF4CAF50);
    case AvatarFrontColor.HARD_BLUE:
      return Color(0xFF1E5C8B);
    case AvatarFrontColor.WHITE:
      return Colors.white;
    default:
      return Colors.white;
  }
}
