import 'package:flutter/cupertino.dart';

class ContainerButton extends StatelessWidget {
  final Widget child;

  const ContainerButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(cursor: SystemMouseCursors.click, child: child);
  }
}
