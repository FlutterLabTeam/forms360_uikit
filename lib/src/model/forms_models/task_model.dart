import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String title;
  final bool taskRejected;
  final Timestamp createdAt;
  final String? taskTemplate;
  final Map<String, dynamic> data;
  final DocumentReference? companyRef;
  final List<TaskFieldModel> customFields;
  final List<RecurringStatusModel> recurringStatus;

  TaskModel({
    this.id,
    this.companyRef,
    this.taskTemplate,
    required this.title,
    this.data = const {},
    this.taskRejected = false,
    required this.createdAt,
    this.customFields = const [],
    this.recurringStatus = const [],
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? status,
    bool? taskRejected,
    String? taskTemplate,
    Timestamp? createDate,
    Map<String, dynamic>? data,
    DocumentReference? companyRef,
    List<TaskFieldModel>? customFields,
    List<RecurringStatusModel>? recurringStatus,
  }) {
    if (status != null && status.isNotEmpty) {
      data?.addAll({});
    }
    return TaskModel(
      id: id ?? this.id,
      data: data ?? this.data,
      title: title ?? this.title,
      createdAt: createDate ?? this.createdAt,
      companyRef: companyRef ?? this.companyRef,
      taskRejected: taskRejected ?? this.taskRejected,
      taskTemplate: taskTemplate ?? this.taskTemplate,
      customFields: customFields ?? this.customFields,
      recurringStatus: recurringStatus ?? this.recurringStatus,
    );
  }

  factory TaskModel.init({DocumentReference? companyRef}) => TaskModel(
        id: null,
        title: "",
        taskRejected: false,
        companyRef: companyRef,
        recurringStatus: const [],
        createdAt: Timestamp.now(),
      );

  Map<String, dynamic> toJson() {
    var json = {
      "createdAt": createdAt,
      "companyRef": companyRef,
      "taskTemplate": taskTemplate,
      "recurringStatus": recurringStatus.map((e) => e.toJson()).toList(),
    };
    json.addAll(data);
    return json;
  }

  Map<String, dynamic> toJsonHive() {
    var json = {
      "id": id,
      "createdAt": createdAt,
      "companyRef": companyRef,
      "taskTemplate": taskTemplate,
      "recurringStatus": recurringStatus.map((e) => e.toJson()).toList(),
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
      title: json["title"] ?? "",
      companyRef: json["companyRef"],
      taskTemplate: json["taskTemplate"] ?? "",
      taskRejected: json["taskRejected"] ?? false,
      createdAt: json["createdAt"] ?? Timestamp.now(),
      customFields: json["customFields"] != null ? List<TaskFieldModel>.from(json["customFields"].map((e) => TaskFieldModel.fromJson(e))) : [],
      recurringStatus: json["recurringStatus"] != null ? List<RecurringStatusModel>.from(json["recurringStatus"].map((e) => RecurringStatusModel.fromJson(e))) : [],
    );
  }

  factory TaskModel.fromJson(json, DocumentReference taskRef) => TaskModel(
        data: json,
        id: taskRef.id,
        companyRef: taskRef,
        title: json["title"] ?? "",
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
