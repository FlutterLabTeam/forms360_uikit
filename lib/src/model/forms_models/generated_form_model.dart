import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forms360_uikit/src/model/forms_models/library_template_enum.dart';

class GeneratedFormModel {
  final bool hasVPN;
  final bool hasJailbreak;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DocumentReference? ref;
  final String? hashFormGenerated;
  final DocumentReference? taskRef;
  final DocumentReference? formRef;
  final DocumentReference? companyRef;
  final DocumentReference? createdByRef;
  final Map<String, dynamic> deviceMetadata;
  final List<ChildFormGeneratedModel> children;

  GeneratedFormModel({
    this.taskRef,
    this.formRef,
    this.companyRef,
    this.createdByRef,
    required this.ref,
    required this.hasVPN,
    required this.children,
    required this.createdAt,
    required this.updatedAt,
    required this.hasJailbreak,
    required this.deviceMetadata,
    required this.hashFormGenerated,
  });

  GeneratedFormModel copyWith({
    bool? hasVPN,
    bool? hasJailbreak,
    DateTime? createdAt,
    DateTime? updatedAt,
    DocumentReference? ref,
    String? hashFormGenerated,
    DocumentReference? taskRef,
    DocumentReference? formRef,
    DocumentReference? companyRef,
    DocumentReference? createdByRef,
    Map<String, dynamic>? deviceMetadata,
    List<ChildFormGeneratedModel>? children,
  }) =>
      GeneratedFormModel(
        ref: ref ?? this.ref,
        hasVPN: hasVPN ?? this.hasVPN,
        taskRef: taskRef ?? this.taskRef,
        formRef: formRef ?? this.formRef,
        children: children ?? this.children,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        companyRef: companyRef ?? this.companyRef,
        hasJailbreak: hasJailbreak ?? this.hasJailbreak,
        createdByRef: createdByRef ?? this.createdByRef,
        deviceMetadata: deviceMetadata ?? this.deviceMetadata,
        hashFormGenerated: hashFormGenerated ?? this.hashFormGenerated,
      );

  factory GeneratedFormModel.fromJson(
    Map<String, dynamic> json,
    DocumentReference formRef,
  ) {
    return GeneratedFormModel(
      ref: formRef,
      formRef: json["form_ref"],
      taskRef: json["task_ref"],
      companyRef: json["company_ref"],
      hasVPN: json["hasVPN"] ?? false,
      createdByRef: json["created_by_ref"],
      hasJailbreak: json["has_jailbreak"] ?? false,
      hashFormGenerated: json["hash_form_generated"],
      updatedAt: json["updated_at"]?.toDate() ?? DateTime.now(),
      createdAt: json["created_at"]?.toDate() ?? DateTime.now(),
      deviceMetadata: Map<String, dynamic>.from(json["device_metadata"] ?? {}),
      children: List<ChildFormGeneratedModel>.from(
        json["children"].map(
          (x) => ChildFormGeneratedModel.fromJson(x),
        ),
      ),
    );
  }

  factory GeneratedFormModel.fromJsonHive(
    Map<String, dynamic> json,
  ) {
    return GeneratedFormModel(
      ref: json["ref"],
      hasVPN: json["hasVPN"],
      formRef: json["form_ref"],
      taskRef: json["task_ref"],
      companyRef: json["company_ref"],
      hasJailbreak: json["has_jailbreak"],
      createdByRef: json["created_by_ref"],
      hashFormGenerated: json["hash_form_generated"],
      updatedAt: json["updated_at"] ?? DateTime.now(),
      createdAt: json["created_at"] ?? DateTime.now(),
      deviceMetadata: Map<String, dynamic>.from(json["device_metadata"] ?? {}),
      children: List<ChildFormGeneratedModel>.from(
        json["children"].map(
          (x) => ChildFormGeneratedModel.fromJson(x),
        ),
      ),
    );
  }

  factory GeneratedFormModel.init() => GeneratedFormModel(
        ref: null,
        children: [],
        taskRef: null,
        hasVPN: false,
        formRef: null,
        companyRef: null,
        createdByRef: null,
        deviceMetadata: {},
        hasJailbreak: false,
        hashFormGenerated: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "hasVPN": hasVPN,
        "form_ref": formRef,
        "task_ref": taskRef,
        "created_at": createdAt,
        "company_ref": companyRef,
        "updated_at": DateTime.now(),
        "has_jailbreak": hasJailbreak,
        "created_by_ref": createdByRef,
        "device_metadata": deviceMetadata,
        "hash_form_generated": hashFormGenerated,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };

  Map<String, dynamic> toJsonHive() => {
        "ref": ref,
        "hasVPN": hasVPN,
        "form_ref": formRef,
        "task_ref": taskRef,
        "created_at": createdAt,
        "company_ref": companyRef,
        "updated_at": DateTime.now(),
        "has_jailbreak": hasJailbreak,
        "created_by_ref": createdByRef,
        "device_metadata": deviceMetadata,
        "hash_form_generated": hashFormGenerated,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class ChildFormGeneratedModel {
  final bool? boolValue;
  final String fieldKey;
  final num numericalValue;
  final String stringValue;
  final DateTime? dateValue;
  final String smartPhotoValue;
  final List<String> listValue;
  final List<String> mediaValue;
  final LibraryTemplateEnum type;
  final Map<String, dynamic> mapValue;
  final List<ChildFormGeneratedModel> childrenValue;

  ChildFormGeneratedModel({
    this.boolValue,
    required this.type,
    required this.fieldKey,
    required this.mapValue,
    required this.dateValue,
    required this.listValue,
    required this.mediaValue,
    required this.stringValue,
    required this.childrenValue,
    required this.numericalValue,
    required this.smartPhotoValue,
  });

  ChildFormGeneratedModel copyWith({
    bool? boolValue,
    String? fieldKey,
    DateTime? dateValue,
    String? stringValue,
    num? numericalValue,
    String? smartPhotoValue,
    List<String>? listValue,
    List<String>? mediaValue,
    LibraryTemplateEnum? type,
    Map<String, dynamic>? mapValue,
    List<ChildFormGeneratedModel>? childrenValue,
  }) =>
      ChildFormGeneratedModel(
        type: type ?? this.type,
        fieldKey: fieldKey ?? this.fieldKey,
        mapValue: mapValue ?? this.mapValue,
        boolValue: boolValue ?? this.boolValue,
        dateValue: dateValue ?? this.dateValue,
        listValue: listValue ?? this.listValue,
        mediaValue: mediaValue ?? this.mediaValue,
        stringValue: stringValue ?? this.stringValue,
        childrenValue: childrenValue ?? this.childrenValue,
        numericalValue: numericalValue ?? this.numericalValue,
        smartPhotoValue: smartPhotoValue ?? this.smartPhotoValue,
      );

  factory ChildFormGeneratedModel.fromJson(Map<String, dynamic> json) =>
      ChildFormGeneratedModel(
        boolValue: json["bool_value"],
        fieldKey: json["field_key"] ?? "",
        stringValue: json["string_value"] ?? "",
        dateValue: _generateDate(json["date_value"]),
        numericalValue: json["numerical_value"] ?? 0,
        smartPhotoValue: json["smart_photo_value"] ?? "",
        type: generateTypeFromString(json["type"] ?? ""),
        listValue: List<String>.from(json["list_value"] ?? []),
        mediaValue: List<String>.from(json["media_value"] ?? []),
        mapValue: Map<String, dynamic>.from(json["map_value"] ?? {}),
        childrenValue: List<ChildFormGeneratedModel>.from(json["children_value"]
            .map((x) => ChildFormGeneratedModel.fromJson(x))),
      );

  factory ChildFormGeneratedModel.init() => ChildFormGeneratedModel(
        fieldKey: "",
        mapValue: {},
        listValue: [],
        mediaValue: [],
        dateValue: null,
        stringValue: "",
        boolValue: null,
        childrenValue: [],
        numericalValue: 0,
        smartPhotoValue: "",
        type: LibraryTemplateEnum.TEXT,
      );

  Map<String, dynamic> toJson() => {
        "type": type.name,
        "map_value": mapValue,
        "field_key": fieldKey,
        "date_value": dateValue,
        "bool_value": boolValue,
        "string_value": stringValue,
        "numerical_value": numericalValue,
        "smart_photo_value": smartPhotoValue,
        "list_value": List<dynamic>.from(listValue.map((x) => x)),
        "media_value": List<dynamic>.from(mediaValue.map((x) => x)),
        "children_value":
            List<dynamic>.from(childrenValue.map((x) => x.toJson())),
      };
}

LibraryTemplateEnum generateTypeFromString(String type) {
  switch (type) {
    case "TEXT":
      return LibraryTemplateEnum.TEXT;
    case "NUMERIC":
      return LibraryTemplateEnum.NUMERIC;
    case "DATE":
      return LibraryTemplateEnum.DATE;
    case "BOOLEAN":
      return LibraryTemplateEnum.BOOLEAN;
    case "BARCODE":
      return LibraryTemplateEnum.BARCODE;
    case "CHECK_LIST":
      return LibraryTemplateEnum.CHECK_LIST;
    case "PHOTO":
      return LibraryTemplateEnum.PHOTO;
    case "VIDEO":
      return LibraryTemplateEnum.VIDEO;
    case "SOUND":
      return LibraryTemplateEnum.SOUND;
    case "SELECTION_LIST":
      return LibraryTemplateEnum.SELECTION_LIST;
    case "GROUP":
      return LibraryTemplateEnum.GROUP;
    case "FORMULA_FIELD":
      return LibraryTemplateEnum.FORMULA_FIELD;
    case "MOBILE_DATA":
      return LibraryTemplateEnum.MOBILE_DATA;
    case "SMART_PHOTO":
      return LibraryTemplateEnum.SMART_PHOTO;
    case "SIGNATURE":
      return LibraryTemplateEnum.SIGNATURE;
    default:
      return LibraryTemplateEnum.TEXT;
  }
}

DateTime? _generateDate(dynamic date) {
  if (date == null) return null;
  if (date is DateTime) return date;
  return date.toDate();
}
