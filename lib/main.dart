import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/src/widgets/pop_up/pop_up_index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookFolder(
          name: 'Pop-ups',
          children: [
            WidgetbookComponent(
              name: 'General',
              useCases: [
                WidgetbookUseCase(
                  name: 'General PopUp',
                  builder: (context) => Center(
                    child: FormsKit.widget.buttons.button(
                      title: 'Abrir PopUp',
                      onPressed: () {
                        PopUpIndex().general(
                          context,
                          child: const Text('Contenido del PopUp'),
                          popUpSize: PopUpSize.MEDIUM,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPhone13ProMax,
            Devices.android.samsungGalaxyS20,
          ],
        ),
      ],
    );
  }
}
