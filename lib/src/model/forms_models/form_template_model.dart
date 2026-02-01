import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forms360_uikit/src/model/forms_models/form_attachment_model.dart';
import 'package:forms360_uikit/src/model/forms_models/form_template_enum.dart';

class FormTemplateModel {
  final int version;
  final String title;
  final bool isActive;
  final bool isDeleted;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool enabledMetadata;
  final bool requireApproval;
  final DocumentReference? ref;
  final bool requiredSubmission;
  final DocumentReference? userRef;
  final FormTemplateStatusEnum status;
  final DocumentReference? companyRef;
  final DocumentReference? creatorRef;
  final DocumentReference? userSelected;
  final List<ItemTemplateModel> children;
  final List<FormAttachmentModel> attachments;

  FormTemplateModel({
    this.ref,
    required this.title,
    required this.status,
    required this.userRef,
    required this.version,
    required this.isActive,
    required this.children,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.companyRef,
    required this.creatorRef,
    required this.description,
    required this.userSelected,
    required this.enabledMetadata,
    required this.requireApproval,
    required this.requiredSubmission,
    this.attachments = const [],
  });

  factory FormTemplateModel.init() => FormTemplateModel(
        ref: null,
        title: '',
        version: 0,
        children: [],
        attachments: [],
        userRef: null,
        isActive: true,
        description: '',
        isDeleted: false,
        creatorRef: null,
        companyRef: null,
        userSelected: null,
        enabledMetadata: true,
        requireApproval: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        requiredSubmission: false,
        status: FormTemplateStatusEnum.DRAFT,
      );

  FormTemplateModel copyWith({
    String? title,
    int? version,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdAt,
    String? description,
    DateTime? updatedAt,
    bool? enabledMetadata,
    bool? requireApproval,
    DocumentReference? ref,
    bool? requiredSubmission,
    DocumentReference? userRef,
    DocumentReference? creatorRef,
    DocumentReference? companyRef,
    FormTemplateStatusEnum? status,
    DocumentReference? userSelected,
    List<ItemTemplateModel>? children,
    List<FormAttachmentModel>? attachments,
  }) =>
      FormTemplateModel(
        ref: ref ?? this.ref,
        title: title ?? this.title,
        status: status ?? this.status,
        version: version ?? this.version,
        userRef: userRef ?? this.userRef,
        children: children ?? this.children,
        attachments: attachments ?? this.attachments,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        creatorRef: creatorRef ?? this.creatorRef,
        companyRef: companyRef ?? this.companyRef,
        description: description ?? this.description,
        userSelected: userSelected ?? this.userSelected,
        enabledMetadata: enabledMetadata ?? this.enabledMetadata,
        requireApproval: requireApproval ?? this.requireApproval,
        requiredSubmission: requiredSubmission ?? this.requiredSubmission,
      );

  factory FormTemplateModel.fromJson(json, DocumentReference ref) =>
      FormTemplateModel(
        ref: ref,
        title: json["title"] ?? '',
        version: json["version"] ?? 0,
        userRef: json["user_ref"] ?? null,
        isActive: json["is_active"] ?? true,
        isDeleted: json["is_deleted"] ?? false,
        description: json["description"] ?? '',
        companyRef: json["company_ref"] ?? null,
        creatorRef: json["creator_ref"] ?? null,
        userSelected: json["user_selected"] ?? null,
        enabledMetadata: json["enabled_metadata"] ?? true,
        requireApproval: json["require_approval"] ?? false,
        status: _generateStatus(json["status"] ?? 'DRAFT'),
        requiredSubmission: json["required_submission"] ?? false,
        createdAt: json["created_at"]?.toDate() ?? DateTime.now(),
        updatedAt: json["updated_at"]?.toDate() ?? DateTime.now(),
        children: List<ItemTemplateModel>.from(
          json["children"]?.map((x) => ItemTemplateModel.fromJson(x)) ?? [],
        ),
        attachments: List<FormAttachmentModel>.from(
          json["attachments"]
                  ?.map((x) => FormAttachmentModel.fromJson(
                      Map<String, dynamic>.from(x as Map)))
              ?? [],
        ),
      );

  factory FormTemplateModel.fromJsonHive(json) => FormTemplateModel(
        ref: json["ref"],
        title: json["title"] ?? '',
        version: json["version"] ?? 0,
        userRef: json["user_ref"] ?? null,
        isActive: json["is_active"] ?? true,
        isDeleted: json["is_deleted"] ?? false,
        description: json["description"] ?? '',
        companyRef: json["company_ref"] ?? null,
        creatorRef: json["creator_ref"] ?? null,
        userSelected: json["user_selected"] ?? null,
        enabledMetadata: json["enabled_metadata"] ?? true,
        requireApproval: json["require_approval"] ?? false,
        status: _generateStatus(json["status"] ?? 'DRAFT'),
        requiredSubmission: json["required_submission"] ?? false,
        createdAt: json["created_at"] ?? DateTime.now(),
        updatedAt: json["updated_at"] ?? DateTime.now(),
        children: List<ItemTemplateModel>.from(
          json["children"]?.map((x) => ItemTemplateModel.fromJson(x)) ?? [],
        ),
        attachments: List<FormAttachmentModel>.from(
          json["attachments"]
                  ?.map((x) => FormAttachmentModel.fromJson(
                      Map<String, dynamic>.from(x as Map)))
              ?? [],
        ),
      );

  Map<String, dynamic> toJsonHive() => {
        "ref": ref,
        "title": title,
        "version": version,
        "user_ref": userRef,
        "status": status.name,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "company_ref": companyRef,
        "creator_ref": creatorRef,
        "description": description,
        "user_selected": userSelected,
        "enabled_metadata": enabledMetadata,
        "require_approval": requireApproval,
        "required_submission": requiredSubmission,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "attachments":
            List<dynamic>.from(attachments.map((x) => x.toJson())),
      };

  Map<String, dynamic> toJson() => {
        "title": title,
        "version": version,
        "user_ref": userRef,
        "status": status.name,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "company_ref": companyRef,
        "creator_ref": creatorRef,
        "description": description,
        "user_selected": userSelected,
        "enabled_metadata": enabledMetadata,
        "require_approval": requireApproval,
        "required_submission": requiredSubmission,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "attachments":
            List<dynamic>.from(attachments.map((x) => x.toJson())),
      };
}

_generateStatus(String status) {
  switch (status) {
    case "DRAFT":
      return FormTemplateStatusEnum.DRAFT;
    case "PUBLISHED":
      return FormTemplateStatusEnum.PUBLISHED;
    case "ARCHIVED":
      return FormTemplateStatusEnum.ARCHIVED;
    default:
      return FormTemplateStatusEnum.DRAFT;
  }
}
