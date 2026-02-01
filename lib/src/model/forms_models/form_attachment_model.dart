/// Model for a file attached to a form template (not a form field).
/// Files are stored in Firebase Storage; [storagePath] is used to get download URL.
class FormAttachmentModel {
  final String name;
  final String storagePath;

  const FormAttachmentModel({
    required this.name,
    required this.storagePath,
  });

  factory FormAttachmentModel.fromJson(Map<String, dynamic> json) =>
      FormAttachmentModel(
        name: json['name'] as String? ?? '',
        storagePath: json['storage_path'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'storage_path': storagePath,
      };

  FormAttachmentModel copyWith({
    String? name,
    String? storagePath,
  }) =>
      FormAttachmentModel(
        name: name ?? this.name,
        storagePath: storagePath ?? this.storagePath,
      );
}
