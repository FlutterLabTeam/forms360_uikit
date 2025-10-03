import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TaskProcessModel taskProcessModelFromJson(String str) =>
    TaskProcessModel.fromJson(json.decode(str));

String taskProcessModelToJson(TaskProcessModel data) =>
    json.encode(data.toJson());

class TaskProcessModel {
  final String id;
  final String name;
  final bool isTemplate;
  final String createdBy;
  final String updatedBy;
  final bool isSequential;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String? description;
  final String? templateName;
  final List<DocumentReference> tags;
  final DocumentReference? companyRef;
  final List<DocumentReference> tasks;

  TaskProcessModel({
    this.companyRef,
    required this.id,
    this.description,
    this.templateName,
    required this.name,
    required this.tags,
    required this.tasks,
    this.isTemplate = false,
    required this.createdBy,
    required this.createdAt,
    required this.updatedBy,
    required this.updatedAt,
    required this.isSequential,
  });

  TaskProcessModel copyWith({
    String? id,
    String? name,
    bool? isTemplate,
    String? createdBy,
    String? updatedBy,
    bool? isSequential,
    DateTime? createdAt,
    String? description,
    DateTime? updatedAt,
    String? templateName,
    DocumentReference? companyRef,
    List<DocumentReference>? tags,
    List<DocumentReference>? tasks,
  }) =>
      TaskProcessModel(
        id: id ?? this.id,
        name: name ?? this.name,
        tags: tags ?? this.tags,
        tasks: tasks ?? this.tasks,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedAt: updatedAt ?? this.updatedAt,
        companyRef: companyRef ?? this.companyRef,
        isTemplate: isTemplate ?? this.isTemplate,
        description: description ?? this.description,
        templateName: templateName ?? this.templateName,
        isSequential: isSequential ?? this.isSequential,
      );

  factory TaskProcessModel.fromJson(Map<String, dynamic> json) =>
      TaskProcessModel(
        id: json["id"],
        name: json["name"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        companyRef: json["companyRef"],
        isTemplate: json["isTemplate"],
        description: json["description"],
        templateName: json["templateName"],
        isSequential: json["isSequential"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        tags: List<DocumentReference>.from(json["tags"].map((x) => x)),
        tasks: List<DocumentReference>.from(json["tasks"].map((x) => x)),
      );


  factory TaskProcessModel.init() =>
      TaskProcessModel(
        id: "",
        name: "",
        tags: [],
        tasks: [],
        createdBy: "",
        updatedBy: "",
        description: "",
        templateName: "",
        isTemplate: false,
        isSequential: false,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "companyRef": companyRef,
        "isTemplate": isTemplate,
        "description": description,
        "templateName": templateName,
        "isSequential": isSequential,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "tasks": List<dynamic>.from(tasks.map((x) => x)),
      };
}
