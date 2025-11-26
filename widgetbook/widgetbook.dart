import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/custom_form_model.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/graph/graph_index.dart';
import 'package:forms360_uikit/src/widgets/inputs/input_index.dart';
import 'package:forms360_uikit/src/widgets/buttons/index_button.dart';
import 'package:forms360_uikit/src/widgets/map/index.dart';
import 'package:forms360_uikit/src/widgets/page/index_page.dart';
import 'package:forms360_uikit/src/widgets/list/index_list.dart';
import 'package:forms360_uikit/src/widgets/pop_up/widget_index_pop_up.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:forms360_uikit/src/widgets/inputs/pop_up_text_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/pop_up_row_text_inputs.dart';
import 'package:forms360_uikit/src/widgets/inputs/tag_widget.dart';
import 'package:forms360_uikit/src/widgets/inputs/custom_form.dart';

void main() {
  runApp(WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  WidgetbookApp({super.key});

  final _uiButton = UiButton();
  final _inputs = Inputs();
  final _maps = Maps();
  final _page = UiPage();
  final _list = UiList();
  final _popUp = WidgetIndexPopUp();
  final _graphs = Graph();

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(
                colorScheme: ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),
                fontFamily: 'Roboto',
              ),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData(
                colorScheme: ColorScheme.dark(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  surface: Colors.grey[900]!,
                  onSurface: Colors.white,
                ),
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPhone12,
            Devices.ios.iPad,
            Devices.android.samsungGalaxyS20,
            Devices.android.samsungGalaxyNote20,
          ],
        ),
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
      ],
      directories: [
        WidgetbookFolder(
          name: 'Inputs',
          children: [
            WidgetbookComponent(
              name: 'PrimaryInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _inputs.primary(
                      label: 'Label',
                      hintText: 'Hint text',
                      isBig: false,
                      enabled: true,
                      isPassword: false,
                      inputColor: PrimaryInputColorKit.BLACK,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Password',
                  builder: (context) => Center(
                    child: _inputs.primary(
                      label: 'Password',
                      hintText: 'Enter your password',
                      isPassword: true,
                      inputColor: PrimaryInputColorKit.BLACK,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Disabled',
                  builder: (context) => Center(
                    child: _inputs.primary(
                      label: 'Disabled Input',
                      hintText: 'Cannot edit this',
                      enabled: false,
                      inputColor: PrimaryInputColorKit.BLACK,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'SearchInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _inputs.searchInput(
                      label: 'Search',
                      hintText: 'Search something...',
                      controller: TextEditingController(),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'DateInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _inputs.dateInput(
                      label: 'Date',
                      hintText: 'Select a date',
                      controller: TextEditingController(),
                      isClearButtonVisible: true,
                      width: 300,
                      maxLength: null,
                      onTap: () {},
                      validator: null,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'PrimaryDateInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _inputs.primaryDateInput(
                      label: 'Fecha',
                      hintText: 'Selecciona una fecha',
                      controller: TextEditingController(),
                      onTap: () {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor selecciona una fecha';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Con Botón de Limpiar',
                  builder: (context) => Center(
                    child: _inputs.primaryDateInput(
                      label: 'Fecha de nacimiento',
                      hintText: 'DD/MM/YYYY',
                      controller: TextEditingController(text: '2024-01-15'),
                      isClearButtonVisible: true,
                      onTap: () {},
                      onTapOutside: () {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor selecciona una fecha';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Deshabilitado',
                  builder: (context) => Center(
                    child: _inputs.primaryDateInput(
                      label: 'Fecha (Deshabilitado)',
                      hintText: 'No se puede editar',
                      controller: TextEditingController(text: '2024-01-15'),
                      enabled: false,
                      onTap: () {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor selecciona una fecha';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Color Personalizado',
                  builder: (context) => Center(
                    child: _inputs.primaryDateInput(
                      label: 'Fecha con color personalizado',
                      hintText: 'Selecciona una fecha',
                      controller: TextEditingController(),
                      inputColor: PrimaryInputColorKit.BLACK,
                      onTap: () {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor selecciona una fecha';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'CheckBox',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _inputs.checkBox(
                      state: false,
                      onTap: (value) {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Checked',
                  builder: (context) => Center(
                    child: _inputs.checkBox(
                      state: true,
                      onTap: (value) {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Disabled',
                  builder: (context) => Center(
                    child: _inputs.checkBox(
                      state: false,
                      onTap: (value) {},
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'OTPInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _inputs.otpInput(
                      controllers:
                          List.generate(6, (index) => TextEditingController()),
                      onSubmit: (code) {},
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'DropdownWritableInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _inputs.dropdownWritableInput(
                      label: 'Select Option',
                      hintText: 'Choose an option',
                      items: ['Option 1', 'Option 2', 'Option 3'],
                      onSuggestionSelected: (value) {},
                      dropdownSearchFieldController: TextEditingController(),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Multiple Selection',
                  builder: (context) => Center(
                    child: _inputs.dropdownWritableInput(
                      label: 'Select Options',
                      hintText: 'Choose multiple options',
                      items: ['Option 1', 'Option 2', 'Option 3'],
                      type: DropdownWritableInputType.MULTI,
                      onSuggestionSelected: (value) {},
                      dropdownSearchFieldController: TextEditingController(),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'PopUpTextInput',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: PopUpTextInput(
                      label: 'Label',
                      hintText: 'Hint text',
                      controller: TextEditingController(),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Suffix Icon',
                  builder: (context) => Center(
                    child: PopUpTextInput(
                      label: 'Label',
                      hintText: 'Hint text',
                      controller: TextEditingController(),
                      isSuffixIconEnabled: true,
                      suffixeIcon: const Icon(Icons.search),
                      suffixIconOnPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Disabled',
                  builder: (context) => Center(
                    child: PopUpTextInput(
                      label: 'Label',
                      hintText: 'Hint text',
                      controller: TextEditingController(),
                      isEnabled: false,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'PopUpRowTextInputs',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: PopUpRowTextInputs(
                      field1: CustomFormFieldModel(
                        label: 'Field 1',
                        hintText: 'Enter value',
                        controller: TextEditingController(),
                        onChanged: (String) {},
                        validator: (String) {
                          return null;
                        },
                      ),
                      field2: CustomFormFieldModel(
                        label: 'Field 2',
                        hintText: 'Enter value',
                        controller: TextEditingController(),
                        onChanged: (String) {},
                        validator: (String) {
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TagWidget',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: TagWidget(
                      onTap: (TagModel) {},
                      tagList: [],
                      onTapAdd: (BuildContext) {},
                      addText: '',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'CustomForm',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: CustomForm(
                      onValidationSuccess: () async {},
                      children: [
                        PopUpTextInput(
                          label: 'Field 1',
                          hintText: 'Enter value',
                          controller: TextEditingController(),
                        ),
                        PopUpTextInput(
                          label: 'Field 2',
                          hintText: 'Enter value',
                          controller: TextEditingController(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Buttons',
          children: [
            WidgetbookComponent(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.button(
                        title: 'Button',
                        onPressed: () {},
                        buttonType: ButtonTypeKit.primary,
                        sizeButton: SizeButtonKit.big,
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Loading',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.button(
                        title: 'Loading Button',
                        onPressed: () {},
                        buttonType: ButtonTypeKit.primary,
                        buttonState: ButtonStateKit.disabled,
                        sizeButton: SizeButtonKit.big,
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Disabled',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.button(
                        title: 'Disabled Button',
                        onPressed: () {},
                        buttonType: ButtonTypeKit.primary,
                        buttonState: ButtonStateKit.disabled,
                        sizeButton: SizeButtonKit.big,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TextButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.textButton(
                        text: 'Text Button',
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Style',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.textButton(
                        text: 'Text Button with Style',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'SelectButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.selectButton(
                        label: 'Select Option',
                        isSelect: false,
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Selected',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.selectButton(
                        label: 'Selected Option',
                        isSelect: true,
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'DottedButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.dottedButton(
                        label: 'Add Item',
                        labelColor: Theme.of(context).colorScheme.primary,
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Custom Icon',
                  builder: (context) => SingleChildScrollView(
                    child: Center(
                      child: _uiButton.dottedButton(
                        label: 'Upload File',
                        icon: Icons.upload_file,
                        labelColor: Theme.of(context).colorScheme.primary,
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Graph',
          children: [
            WidgetbookComponent(
              name: 'Animated Circle Percentage',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _graphs.animatedCirclePercentage(
                      percentage: 75,
                      size: 200,
                      color: Colors.blue,
                      strokeWidth: 10,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Animated Bar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _graphs.animatedBar(
                      itemName: 'Item',
                      itemValue: 75,
                      max: 100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Map',
          children: [
            WidgetbookComponent(
              name: 'Map Widget',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _maps.map(
                      onSave: (markers) {},
                      initialLocation: const LatLng(0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Page',
          children: [
            WidgetbookComponent(
              name: 'Management Page',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _page.managementPage(
                      endContent: const Text('End Content'),
                      startContent: const Text('Start Content'),
                      profileLetter: 'A',
                      onProfileTap: () {},
                      selectedMenuItem: MenuItemTypeKit.DASHBOARD,
                      onMenuItemSelected: (item) {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'List',
          children: [
            WidgetbookComponent(
              name: 'Grid View Generator',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _list.gridViewGenerator(
                      list: List.generate(10, (index) => index),
                      itemBuilder: (context, index) => Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text('Item $index'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'List Generator',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _list.listGenerator(
                      list: List.generate(10, (index) => index),
                      itemBuilder: (context, index) => Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text('Item $index'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Pop Up',
          children: [
            WidgetbookComponent(
              name: 'Delete Pop Up',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Center(
                    child: _popUp.deletePopUp(
                      title: 'Delete Item',
                      description: 'Are you sure you want to delete this item?',
                      onTap: () async {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Menu',
          children: [
            WidgetbookComponent(
              name: 'Menu Icon',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Center(
                    child: MenuIcon(
                      type: MenuItemTypeKit.DASHBOARD,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Selected',
                  builder: (context) => const Center(
                    child: MenuIcon(
                      type: MenuItemTypeKit.DASHBOARD,
                      isSelected: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
