import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/screen_breakpoints.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/logo.dart';

class ManagementMultiPage extends StatelessWidget {
  const ManagementMultiPage({
    super.key,
    this.onPop,
    this.serviceWeb,
    required this.spacing,
    required this.assetPath,
    required this.endContent,
    required this.startContent,
    required this.onProfileTap,
    required this.enableGoHome,
    required this.profileLetter,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
  });

  final double spacing;
  final bool? serviceWeb;
  final String assetPath;
  final bool enableGoHome;
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
        if (constraints.maxWidth >= Breakpoint.xdesktop) {
          return BigScreenWidget(
            onPop: onPop,
            spacing: spacing,
            assetPath: assetPath,
            endContent: endContent,
            serviceWeb: serviceWeb,
            startContent: startContent,
            onProfileTap: onProfileTap,
            enableGoHome: enableGoHome,
            profileLetter: profileLetter,
            rowMainAxisAlignment: rowMainAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
          );
        } else if (constraints.maxWidth >= Breakpoint.tablet &&
            constraints.maxWidth < Breakpoint.xdesktop) {
          return MediumScreenWidget(
            spacing: spacing,
            endContent: endContent,
            serviceWeb: serviceWeb,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            rowMainAxisAlignment: rowMainAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
          );
        } else {
          return SmallScreenWidget(
            endContent: endContent,
            serviceWeb: serviceWeb,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
          );
        }
      },
    );
  }
}

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({
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
      children: List.generate(
        endContent.length,
        (index) => endContent[index],
      ),
    );
  }
}

class MediumScreenWidget extends StatelessWidget {
  const MediumScreenWidget({
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
      padding: const EdgeInsets.only(
        top: 24.0,
        left: 24.0,
        bottom: 24.0,
      ),
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

class BigScreenWidget extends StatelessWidget {
  const BigScreenWidget({
    super.key,
    this.onPop,
    this.serviceWeb,
    required this.spacing,
    required this.endContent,
    required this.startContent,
    required this.onProfileTap,
    required this.enableGoHome,
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
      padding: const EdgeInsets.only(
        top: 24.0,
        left: 24.0,
        bottom: 24.0,
      ),
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment,
        children: [
          SizedBox(width: spacing),
          Expanded(
            flex: 1,
            child: LeftDecoration(
              assetPath: assetPath,
              startContent: startContent,
              enableGoHome: enableGoHome,
              onPop: onPop,
              hasBackButton: hasBackButton,
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            flex: 2,
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

class LeftDecoration extends StatelessWidget {
  const LeftDecoration({
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
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
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
