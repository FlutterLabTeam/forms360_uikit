

import 'package:forms360_uikit/src/model/forms_models/generated_form_model.dart';
import 'package:forms360_uikit/src/model/forms_models/library_template_enum.dart';

extension ChildFormGeneratedExtension on ChildFormGeneratedModel {
  bool get validateValueIsNotEmpty {
    if (type == LibraryTemplateEnum.DATE) {
      return dateValue != null;
    }
    if (type == LibraryTemplateEnum.BARCODE) {
      return stringValue.isNotEmpty;
    }
    if (type == LibraryTemplateEnum.BOOLEAN) {
      return boolValue != null;
    }
    if (type == LibraryTemplateEnum.NUMERIC) {
      return numericalValue != 0;
    }
    if (type == LibraryTemplateEnum.PHOTO) {
      return stringValue.isNotEmpty;
    }
    if (type == LibraryTemplateEnum.VIDEO) {
      return stringValue.isNotEmpty;
    }
    if (type == LibraryTemplateEnum.SOUND) {
      return stringValue.isNotEmpty;
    }
    if (type == LibraryTemplateEnum.SELECTION_LIST) {
      return stringValue.isNotEmpty;
    }
    if (type == LibraryTemplateEnum.CHECK_LIST) {
      return stringValue.isNotEmpty;
    }
    if (type == LibraryTemplateEnum.TEXT) {
      return stringValue.isNotEmpty;
    }
    if (type == LibraryTemplateEnum.SIGNATURE) {
      return stringValue.isNotEmpty;
    }
  
    return false;
  }
}
