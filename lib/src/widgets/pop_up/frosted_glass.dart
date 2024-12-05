// ignore_for_file: prefer_typing_uninitialized_variables
// script by Hovered Cube
// This is the source code of HoveredCube video:
// "How to create frostedGlass in flutter"
// Tutorial Video link :
// - https://github.com/HoveredCube/frostedglass_video1
// Follow @HoveredCube on instagram.

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:go_router/go_router.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({
    Key? key,
    required this.theWidth,
    required this.theHeight,
  }) : super(key: key);

  final theWidth;
  final theHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(context),
      child: ClipRRect(
        child: Container(
          width: theWidth,
          height: theHeight,
          color: Colors.transparent,
          //we use Stack(); because we want the effects be on top of each other,
          //  just like layer in photoshop.
          child: Stack(
            children: [
              //blur effect ==> the third layer of stack
              BackdropFilter(
                filter: ImageFilter.blur(
                  //sigmaX is the Horizontal blur
                  sigmaX: 4.0,
                  //sigmaY is the Vertical blur
                  sigmaY: 4.0,
                ),
                //we use this container to scale up the blur effect to fit its
                //  parent, without this container the blur effect doesn't appear.
                child: Container(),
              ),
              //gradient effect ==> the second layer of stack
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.24)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //begin color
                        Theme.of(context).primaryColor.withOpacity(0.40),
                        //end color
                        Colors.white.withOpacity(0.40),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
