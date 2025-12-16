import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forms360_uikit/src/model/clock_location.dart';

class TaskModel {
  final String? id;
  final String title;
  final bool taskRejected;
  final Timestamp createdAt;
  final String? taskTemplate;
  final DocumentReference? ref;
  final Map<String, dynamic> data;
  final DocumentReference? companyRef;
  final List<TaskFieldModel> customFields;
  final List<RecurringStatusModel> recurringStatus;
  final ClockLocation clockInLocation;
  final ClockLocation clockOutLocation;

  TaskModel({
    this.id,
    this.ref,
    this.companyRef,
    this.taskTemplate,
    required this.title,
    this.data = const {},
    this.taskRejected = false,
    required this.createdAt,
    this.customFields = const [],
    this.recurringStatus = const [],
    required this.clockInLocation,
    required this.clockOutLocation,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? status,
    bool? taskRejected,
    String? taskTemplate,
    Timestamp? createDate,
    DocumentReference? ref,
    Map<String, dynamic>? data,
    DocumentReference? companyRef,
    List<TaskFieldModel>? customFields,
    List<RecurringStatusModel>? recurringStatus,
    ClockLocation? clockInLocation,
    ClockLocation? clockOutLocation,
  }) {
    if (status != null && status.isNotEmpty) {
      data?.addAll({});
    }
    return TaskModel(
      id: id ?? this.id,
      ref: ref ?? this.ref,
      data: data ?? this.data,
      title: title ?? this.title,
      createdAt: createDate ?? this.createdAt,
      companyRef: companyRef ?? this.companyRef,
      taskRejected: taskRejected ?? this.taskRejected,
      taskTemplate: taskTemplate ?? this.taskTemplate,
      customFields: customFields ?? this.customFields,
      recurringStatus: recurringStatus ?? this.recurringStatus,
      clockInLocation: clockInLocation ?? this.clockInLocation,
      clockOutLocation: clockOutLocation ?? this.clockOutLocation,
    );
  }

  factory TaskModel.init({DocumentReference? companyRef}) => TaskModel(
        id: null,
        ref: null,
        title: "",
        taskRejected: false,
        companyRef: companyRef,
        recurringStatus: const [],
        createdAt: Timestamp.now(),
        clockInLocation: ClockLocation.init(),
        clockOutLocation: ClockLocation.init(),
      );

  Map<String, dynamic> toJson() {
    var json = {
      "ref": ref,
      "createdAt": createdAt,
      "companyRef": companyRef,
      "taskTemplate": taskTemplate,
      "recurringStatus": recurringStatus.map((e) => e.toJson()).toList(),
      "clockInLocation": clockInLocation.toJson(),
      "clockOutLocation": clockOutLocation.toJson(),
    };
    json.addAll(data);
    return json;
  }

  Map<String, dynamic> toJsonHive() {
    var json = {
      "id": id,
      "ref": ref,
      "createdAt": createdAt,
      "companyRef": companyRef,
      "taskTemplate": taskTemplate,
      "recurringStatus": recurringStatus.map((e) => e.toJson()).toList(),
      "clockInLocation": clockInLocation.toJson(),
      "clockOutLocation": clockOutLocation.toJson(),
    };

    // Filtrar elementos null de data antes de agregarlo
    var filteredData = Map<String, dynamic>.fromEntries(
      data.entries.where((entry) => entry.value != null)
    );
    json.addAll(filteredData);

    return json;
  }

  factory TaskModel.fromJsonHive(json) {
    return TaskModel(
      data: json,
      id: json["id"],
      ref: json["ref"],
      title: json["title"] ?? "",
      companyRef: json["companyRef"],
      taskTemplate: json["taskTemplate"] ?? "",
      taskRejected: json["taskRejected"] ?? false,
      createdAt: json["createdAt"] ?? Timestamp.now(),
      customFields: json["customFields"] != null ? List<TaskFieldModel>.from(json["customFields"].map((e) => TaskFieldModel.fromJson(e))) : [],
      recurringStatus: json["recurringStatus"] != null ? List<RecurringStatusModel>.from(json["recurringStatus"].map((e) => RecurringStatusModel.fromJson(e))) : [],
      clockInLocation: json["clockInLocation"] != null ? ClockLocation.fromJson(json["clockInLocation"]) : ClockLocation.init(),
      clockOutLocation: json["clockOutLocation"] != null ? ClockLocation.fromJson(json["clockOutLocation"]) : ClockLocation.init(),
    );
  }

  factory TaskModel.fromJson(json, DocumentReference taskRef) => TaskModel(
        data: json,
        ref: taskRef,
        id: taskRef.id,
        title: json["title"] ?? "",
        companyRef: json["companyRef"],
        taskTemplate: json["taskTemplate"] ?? "",
        taskRejected: json["taskRejected"] ?? false,
        recurringStatus: json["recurringStatus"] != null
            ? List<RecurringStatusModel>.from(
                json["recurringStatus"]
                    .map((e) => RecurringStatusModel.fromJson(e)),
              )
            : [],
        createdAt: json["createdAt"] ?? Timestamp.now(),
        customFields: List<TaskFieldModel>.from(
          json.keys.map((key) => TaskFieldModel(key: key, title: key)),
        ),
        clockInLocation: json["clockInLocation"] != null ? ClockLocation.fromJson(json["clockInLocation"]) : ClockLocation.init(),
        clockOutLocation: json["clockOutLocation"] != null ? ClockLocation.fromJson(json["clockOutLocation"]) : ClockLocation.init(),
      );

  factory TaskModel.fromJsonChild(
    json,
  ) =>
      TaskModel(
        data: json,
        title: json["title"] ?? "",
        taskTemplate: json["taskTemplate"] ?? "",
        taskRejected: json["taskRejected"] ?? false,
        createdAt: json["createdAt"] ?? Timestamp.now(),
        customFields: List<TaskFieldModel>.from(
          json.keys.map(
            (key) => TaskFieldModel(key: key, title: key),
          ),
        ),
        clockInLocation: ClockLocation.init(),
        clockOutLocation: ClockLocation.init(),
      );

  factory TaskModel.fromTemplateJson(Map<String, dynamic> json) => TaskModel(
        data: json,
        title: json["title"] ?? "",
        taskTemplate: json["taskTemplate"] ?? "",
        taskRejected: json["taskRejected"] ?? false,
        createdAt: json["createdAt"] ?? Timestamp.now(),
        customFields:
            List<TaskFieldModel>.from(json.keys.map((key) => TaskFieldModel(
                  key: key,
                  title: key,
                ))),
        clockInLocation: ClockLocation.init(),
        clockOutLocation: ClockLocation.init(),
      );
}

class RecurringStatusModel {
  final DateTime createdAt;
  final DateTime updateAt;
  final TaskModel data;

  RecurringStatusModel({
    required this.createdAt,
    required this.updateAt,
    required this.data,
  });

  RecurringStatusModel copyWith({
    DateTime? createdAt,
    DateTime? updateAt,
    TaskModel? data,
  }) =>
      RecurringStatusModel(
        data: data ?? this.data,
        updateAt: updateAt ?? this.updateAt,
        createdAt: createdAt ?? this.createdAt,
      );

  factory RecurringStatusModel.fromJson(Map<String, dynamic> json) =>
      RecurringStatusModel(
        updateAt: json["update_at"].toDate(),
        createdAt: json["created_at"].toDate(),
        data: TaskModel.fromJsonChild(json["data"]),
      );

  factory RecurringStatusModel.init() => RecurringStatusModel(
        data: TaskModel.init(),
        updateAt: DateTime.now(),
        createdAt: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "update_at": updateAt,
        "created_at": createdAt,
      };
}

class TaskFieldModel {
  final String key;
  final String title;
  final FieldType type;

  TaskFieldModel({
    required this.key,
    required this.title,
    this.type = FieldType.string,
  });

  factory TaskFieldModel.fromJson(Map<String, dynamic> json) => TaskFieldModel(
        key: json["key"],
        type: json["type"] == null
            ? FieldType.string
            : FieldType.fromString(json["type"]),
        title: json["title"],
      );

  TaskFieldModel copyWith({String? title}) => TaskFieldModel(
        key: key,
        type: type,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "type": type.description,
        "title": title,
      };
}

enum FieldType {
  string("Text"),
  date("Date"),
  bool("TrueOrFalse"),
  double("Numbers"),
  ;

  const FieldType(this.description);

  final String description;

  static FieldType fromString(String value) {
    int index =
        FieldType.values.indexWhere((element) => element.description == value);
    return index == -1 ? FieldType.string : FieldType.values[index];
  }

  static List<String> get descriptionValues =>
      FieldType.values.map((e) => e.description).toList();
}
