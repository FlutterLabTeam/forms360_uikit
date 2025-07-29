import 'package:forms360_uikit/forms360_uikit.dart';

class ItemTemplateModel {
  final String key;
  final String label;
  final bool showLastInput;
  final bool activateMetadata;
  final FormulaModel? formula;
  final CheckListModel checkList;
  final LibraryTemplateEnum type;
  final List<Condition> conditions;
  final List<Validation> validation;
  final SmartPhotoModel? smartPhoto;
  final List<String> matchesItemFromList;
  final List<ItemTemplateModel> children;

  ItemTemplateModel({
    this.formula,
    this.smartPhoto,
    required this.key,
    required this.type,
    required this.label,
    required this.children,
    required this.checkList,
    required this.conditions,
    required this.validation,
    required this.showLastInput,
    required this.activateMetadata,
    required this.matchesItemFromList,
  });

  factory ItemTemplateModel.init() => ItemTemplateModel(
        key: '',
        label: '',
        children: [],
        formula: null,
        conditions: [],
        validation: [],
        smartPhoto: null,
        showLastInput: false,
        activateMetadata: false,
        type: LibraryTemplateEnum.TEXT,
        checkList: CheckListModel.init(),
        matchesItemFromList: [],
      );

  ItemTemplateModel copyWith({
    String? key,
    String? label,
    bool? showLastInput,
    FormulaModel? formula,
    bool? activateMetadata,
    LibraryTemplateEnum? type,
    CheckListModel? checkList,
    List<Condition>? conditions,
    SmartPhotoModel? smartPhoto,
    List<Validation>? validation,
    List<ItemTemplateModel>? children,
    List<String>? matchesItemFromList,
    bool? isStatic,
  }) =>
      ItemTemplateModel(
        key: key ?? this.key,
        type: type ?? this.type,
        label: label ?? this.label,
        formula: formula ?? this.formula,
        children: children ?? this.children,
        checkList: checkList ?? this.checkList,
        conditions: conditions ?? this.conditions,
        validation: validation ?? this.validation,
        smartPhoto: smartPhoto ?? this.smartPhoto,
        showLastInput: showLastInput ?? this.showLastInput,
        activateMetadata: activateMetadata ?? this.activateMetadata,
        matchesItemFromList: matchesItemFromList ?? this.matchesItemFromList,
      );

  factory ItemTemplateModel.fromJson(Map<String, dynamic> json) =>
      ItemTemplateModel(
        key: json["key"],
        label: json["label"],
        showLastInput: json["show_last_input"] ?? false,
        type: _generateLibraryTemplateEnum(json["type"]),
        checkList: json["check_list"] != null
            ? CheckListModel.fromJson(json["check_list"])
            : CheckListModel.init(),
        formula: json["formula"] != null
            ? FormulaModel.fromJson(json["formula"])
            : null,
        conditions: List<Condition>.from(
          json["conditions"].map((x) => Condition.fromJson(x)),
        ),
        children: List<ItemTemplateModel>.from(
          json["children"].map((x) => ItemTemplateModel.fromJson(x)),
        ),
        validation: List<Validation>.from(
          json["validation"].map((x) => Validation.fromJson(x)),
        ),
        smartPhoto: json["smart_photo"] != null
            ? SmartPhotoModel.fromJson(json["smart_photo"])
            : null,
        activateMetadata: json["activate_metadata"] ?? false,
        matchesItemFromList: json["matches_item_from_list"] != null
            ? List<String>.from(json["matches_item_from_list"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "label": label,
        "type": type.name,
        "formula": formula?.toJson(),
        "check_list": checkList.toJson(),
        "show_last_input": showLastInput,
        "smart_photo": smartPhoto?.toJson(),
        "activate_metadata": activateMetadata,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "validation": List<dynamic>.from(validation.map((x) => x.toJson())),
        "conditions": List<dynamic>.from(conditions.map((x) => x.toJson())),
        "matches_item_from_list":
            List<dynamic>.from(matchesItemFromList.map((x) => x)),
      };
}

class Validation {
  final String value;
  final double numericValue;
  final String stringValue;
  final ValidationType type;

  Validation({
    required this.type,
    required this.value,
    required this.numericValue,
    this.stringValue = '',
  });

  Validation copyWith({
    String? value,
    ValidationType? type,
    double? numericValue,
    String? stringValue,
  }) =>
      Validation(
        type: type ?? this.type,
        value: value ?? this.value,
        numericValue: numericValue ?? this.numericValue,
        stringValue: stringValue ?? this.stringValue,
      );

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        value: json["value"],
        numericValue: json["numeric_value"]?.toDouble() ?? 0.0,
        type: _generateValidation(json["type"]),
        stringValue: json["string_value"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "type": type.name,
        "numeric_value": numericValue,
        "string_value": stringValue,
      };
}

class Condition {
  final dynamic value;
  final String? parentKey;
  final ConditionType? type;
  final LibraryTemplateEnum? parentType;

  Condition({
    required this.type,
    this.value,
    this.parentKey,
    this.parentType,
  });

  Condition copyWith({
    dynamic value,
    String? parentKey,
    ConditionType? type,
    LibraryTemplateEnum? parentType,
  }) =>
      Condition(
        type: type ?? this.type,
        value: value ?? this.value,
        parentKey: parentKey ?? this.parentKey,
        parentType: parentType ?? this.parentType,
      );

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        value: json["value"],
        parentKey: json["parentKey"],
        type: _generateCondition(json["type"]),
        parentType: _generateLibraryTemplateEnum(json["parentType"]),
      );

  factory Condition.initial() => Condition(
        type: null,
        value: null,
        parentKey: null,
        parentType: null,
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "type": type?.name,
        "parentKey": parentKey,
        "parentType": parentType?.name,
      };

  bool get isNotEmpty {
    if (type == null) return false;
    if (parentKey == null) return false;
    if (parentType == null) return false;
    if (value == null && validateCondition()) return true;
    if (value == null && !validateTheTypeWithoutValue()) return false;
    return true;
  }

  bool validateCondition() {
    if (type == ConditionType.IS_EMPTY ||
        type == ConditionType.IS_NOT_EMPTY) {
      return true;
    }
    return false;
  }

  bool validateTheTypeWithoutValue() {
    final isPhoto = parentType == LibraryTemplateEnum.PHOTO;
    final isVideo = parentType == LibraryTemplateEnum.VIDEO;
    final isSound = parentType == LibraryTemplateEnum.SOUND;
    final isBarcode = parentType == LibraryTemplateEnum.BARCODE;
    final isCheckList = parentType == LibraryTemplateEnum.CHECK_LIST;
    final isMobileData = parentType == LibraryTemplateEnum.MOBILE_DATA;
    final isSelectionList = parentType == LibraryTemplateEnum.SELECTION_LIST;
    final isBoolean = parentType == LibraryTemplateEnum.BOOLEAN;
    final isGroup = parentType == LibraryTemplateEnum.GROUP;

    if (isPhoto ||
        isVideo ||
        isSound ||
        isBarcode ||
        isCheckList ||
        isMobileData ||
        isSelectionList ||
        isGroup ||
        isBoolean) {
      return true;
    }
    return false;
  }
}

class FormulaModel {
  final OperatorType? operatorKey;
  final String firstFormulaKey;
  final String secondFormulaKey;

  FormulaModel({
    this.operatorKey,
    required this.firstFormulaKey,
    required this.secondFormulaKey,
  });

  FormulaModel copyWith({
    OperatorType? operatorKey,
    String? firstFormulaKey,
    String? secondFormulaKey,
  }) =>
      FormulaModel(
        operatorKey: operatorKey ?? this.operatorKey,
        firstFormulaKey: firstFormulaKey ?? this.firstFormulaKey,
        secondFormulaKey: secondFormulaKey ?? this.secondFormulaKey,
      );

  factory FormulaModel.init() => FormulaModel(
        operatorKey: null,
        firstFormulaKey: '',
        secondFormulaKey: '',
      );

  factory FormulaModel.fromJson(Map<String, dynamic> json) => FormulaModel(
        operatorKey: json["operator_key"] != null
            ? OperatorType.values.firstWhere(
                (e) => e.name == json["operator_key"],
              )
            : null,
        firstFormulaKey: json["first_formula_key"],
        secondFormulaKey: json["second_formula_key"],
      );

  Map<String, dynamic> toJson() => {
        "operator_key": operatorKey?.name,
        "first_formula_key": firstFormulaKey,
        "second_formula_key": secondFormulaKey,
      };
}

class SmartPhotoModel {
  final String prompt;
  final String smartPhoto;

  SmartPhotoModel({
    required this.prompt,
    required this.smartPhoto,
  });

  SmartPhotoModel copyWith({
    String? prompt,
    String? smartPhoto,
  }) =>
      SmartPhotoModel(
        prompt: prompt ?? this.prompt,
        smartPhoto: smartPhoto ?? this.smartPhoto,
      );

  factory SmartPhotoModel.fromJson(Map<String, dynamic> json) =>
      SmartPhotoModel(
        prompt: json["prompt"],
        smartPhoto: json["smart_photo"],
      );

  Map<String, dynamic> toJson() => {
        "prompt": prompt,
        "smart_photo": smartPhoto,
      };
}

class CheckListModel {
  final bool multiSelectors;
  final List<String> checkListOptions;

  CheckListModel({
    required this.multiSelectors,
    required this.checkListOptions,
  });

  CheckListModel copyWith({
    bool? multiSelectors,
    List<String>? checkListOptions,
  }) =>
      CheckListModel(
        multiSelectors: multiSelectors ?? this.multiSelectors,
        checkListOptions: checkListOptions ?? this.checkListOptions,
      );

  factory CheckListModel.fromJson(Map<String, dynamic> json) => CheckListModel(
        multiSelectors: json["multi_selectors"] ?? false,
        checkListOptions: List<String>.from(
          json["check_list_options"].map((x) => x),
        ),
      );

  factory CheckListModel.init() => CheckListModel(
        checkListOptions: [],
        multiSelectors: false,
      );

  Map<String, dynamic> toJson() => {
        "multi_selectors": multiSelectors,
        "check_list_options": List<dynamic>.from(
          checkListOptions.map((x) => x),
        ),
      };
}

LibraryTemplateEnum _generateLibraryTemplateEnum(String value) {
  switch (value) {
    case 'TEXT':
      return LibraryTemplateEnum.TEXT;
    case 'NUMERIC':
      return LibraryTemplateEnum.NUMERIC;
    case 'DATE':
      return LibraryTemplateEnum.DATE;
    case 'PHOTO':
      return LibraryTemplateEnum.PHOTO;
    case 'VIDEO':
      return LibraryTemplateEnum.VIDEO;
    case 'SOUND':
      return LibraryTemplateEnum.SOUND;
    case 'BARCODE':
      return LibraryTemplateEnum.BARCODE;
    case 'MOBILE_DATA':
      return LibraryTemplateEnum.MOBILE_DATA;
    case 'SELECTION_LIST':
      return LibraryTemplateEnum.SELECTION_LIST;
    case 'CHECK_LIST':
      return LibraryTemplateEnum.CHECK_LIST;
    case 'SMART_PHOTO':
      return LibraryTemplateEnum.SMART_PHOTO;
    case 'BOOLEAN':
      return LibraryTemplateEnum.BOOLEAN;
    case 'GROUP':
      return LibraryTemplateEnum.GROUP;
    case 'FORMULA_FIELD':
      return LibraryTemplateEnum.FORMULA_FIELD;
    case 'SIGNATURE':
      return LibraryTemplateEnum.SIGNATURE;
    default:
      return LibraryTemplateEnum.TEXT;
  }
}

ConditionType _generateCondition(String value) {
  switch (value) {
    case 'EQUALS':
      return ConditionType.EQUALS;
    case 'NOT_EQUALS':
      return ConditionType.NOT_EQUALS;
    case 'GREATER_THAN':
      return ConditionType.GREATER_THAN;
    case 'LESS_THAN':
      return ConditionType.LESS_THAN;
    case 'GREATER_THAN_OR_EQUALS':
      return ConditionType.GREATER_THAN_OR_EQUALS;
    case 'LESS_THAN_OR_EQUALS':
      return ConditionType.LESS_THAN_OR_EQUALS;
    case 'CONTAINS':
      return ConditionType.CONTAINS;
    case 'STARTS_WITH':
      return ConditionType.STARTS_WITH;
    case 'IS_EMPTY':
      return ConditionType.IS_EMPTY;
    case 'IS_NOT_EMPTY':
      return ConditionType.IS_NOT_EMPTY;
    case 'IS_TRUE':
      return ConditionType.IS_TRUE;
    case 'IS_FALSE':
      return ConditionType.IS_FALSE;
    default:
      return ConditionType.EQUALS;
  }
}

ValidationType _generateValidation(String value) {
  switch (value) {
    case 'REQUIRED':
      return ValidationType.REQUIRED;
    case 'IS_URL':
      return ValidationType.IS_URL;
    case 'IS_EMAIL':
      return ValidationType.IS_EMAIL;
    case 'IS_PHONE':
      return ValidationType.IS_PHONE;
    case 'MIN_LENGTH':
      return ValidationType.MIN_LENGTH;
    case 'MAX_LENGTH':
      return ValidationType.MAX_LENGTH;
    case 'IS_LESS_THAN_NOW':
      return ValidationType.IS_LESS_THAN_NOW;
    case 'IS_GREATER_THAN_NOW':
      return ValidationType.IS_GREATER_THAN_NOW;
    case 'MATCHES_ITEM_FROM_LIST':
      return ValidationType.MATCHES_ITEM_FROM_LIST;
    case 'IS_STATIC':
      return ValidationType.IS_STATIC;
    default:
      return ValidationType.REQUIRED;
  }
}
