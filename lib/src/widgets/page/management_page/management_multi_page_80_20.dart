import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/screen_breakpoints.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/logo.dart';
import 'package:go_router/go_router.dart';

class ManagementMultiPage8020 extends StatelessWidget {
  const ManagementMultiPage8020({
    super.key,
    this.onPop,
    this.serviceWeb,
    required this.spacing,
    required this.assetPath,
    required this.endContent,
    required this.startContent,
    required this.onProfileTap,
    required this.enableGoHome,
    required this.showStartContent,
    required this.profileLetter,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
  });

  final double spacing;
  final bool? serviceWeb;
  final String assetPath;
  final bool enableGoHome;
  final bool showStartContent;
  final VoidCallback? onPop;
  final Widget startContent;
  final String profileLetter;
  final List<Widget> endContent;
  final GestureTapCallback onProfileTap;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //  if (constraints.maxWidth >= Breakpoint.xdesktop) {
        return BigScreenWidget8020(
          onPop: onPop,
          spacing: spacing,
          assetPath: assetPath,
          endContent: endContent,
          serviceWeb: serviceWeb,
          startContent: startContent,
          onProfileTap: onProfileTap,
          enableGoHome: enableGoHome,
          showStartContent: showStartContent,
          profileLetter: profileLetter,
          rowMainAxisAlignment: rowMainAxisAlignment,
          rowCrossAxisAlignment: rowCrossAxisAlignment,
        );
        /*
        } else if (constraints.maxWidth >= Breakpoint.tablet &&
            constraints.maxWidth < Breakpoint.xdesktop) {
          return MediumScreenWidget8020(
            spacing: spacing,
            endContent: endContent,
            serviceWeb: serviceWeb,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            rowMainAxisAlignment: rowMainAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
          );
        } else {
          return SmallScreenWidget8020(
            endContent: endContent,
            serviceWeb: serviceWeb,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
          );
        }
        */
      },
    );
  }
}

class SmallScreenWidget8020 extends StatelessWidget {
  const SmallScreenWidget8020({
    super.key,
    this.serviceWeb,
    required this.endContent,
    required this.onProfileTap,
    required this.profileLetter,
  });

  final bool? serviceWeb;
  final String profileLetter;
  final List<Widget> endContent;
  final GestureTapCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(endContent.length, (index) => endContent[index]),
    );
  }
}

class MediumScreenWidget8020 extends StatelessWidget {
  const MediumScreenWidget8020({
    super.key,
    this.serviceWeb,
    required this.spacing,
    required this.endContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
  });

  final double spacing;
  final bool? serviceWeb;
  final String profileLetter;
  final List<Widget> endContent;
  final GestureTapCallback onProfileTap;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment,
        children: [
          SizedBox(width: spacing),
          Row(
            children: List.generate(
              endContent.length,
              (index) => endContent[index],
            ),
          ),
        ],
      ),
    );
  }
}

class BigScreenWidget8020 extends StatelessWidget {
  const BigScreenWidget8020({
    super.key,
    this.onPop,
    this.serviceWeb,
    required this.spacing,
    required this.endContent,
    required this.startContent,
    required this.onProfileTap,
    required this.enableGoHome,
    required this.showStartContent,
    required this.profileLetter,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    this.hasBackButton = false,
    this.assetPath = 'assets/images/clients/users_background.png',
  });

  final double spacing;
  final bool? serviceWeb;
  final String assetPath;
  final bool enableGoHome;
  final bool showStartContent;
  final VoidCallback? onPop;
  final Widget startContent;
  final String profileLetter;
  final List<Widget> endContent;
  final GestureTapCallback onProfileTap;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment,
        children: [
          SizedBox(width: spacing),
          if (showStartContent) ...[
            Expanded(
              flex: 7, // 70% del espacio
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: startContent,
              ),
            ),
            SizedBox(width: spacing),
          ],
          Expanded(
            flex: showStartContent
                ? 3
                : 1, // 30% del espacio cuando hay columna izquierda
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                endContent.length,
                (index) => endContent[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeftDecoration8020 extends StatelessWidget {
  const LeftDecoration8020({
    super.key,
    required this.startContent,
    required this.assetPath,
    required this.enableGoHome,
    this.onPop,
    this.hasBackButton = false,
  });

  final Widget startContent;
  final String assetPath;
  final bool enableGoHome;
  final VoidCallback? onPop;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(assetPath).image,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (hasBackButton)
              InkWell(
                onTap: onPop,
                child: Icon(Icons.chevron_left, color: Colors.white),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 53.0),
              child: InkWell(
                onTap: onPop,
                child: LogoForms(color: LogoColor.WHITE),
              ),
            ),
          ],
        ),
        Center(child: startContent),
      ],
    );
  }
}
