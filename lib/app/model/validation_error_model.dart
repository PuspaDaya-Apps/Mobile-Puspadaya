class ValidationErrorModel {
  final String message;
  final Map<String, List<String>> errors;

  ValidationErrorModel({
    required this.message,
    required this.errors,
  });

  factory ValidationErrorModel.fromJson(Map<String, dynamic> json) {
    final parsedErrors = <String, List<String>>{};

    final rawErrors = json['errors'] as Map<String, dynamic>;

    rawErrors.forEach((field, value) {
      if (value is List) {
        parsedErrors[field] = List<String>.from(value);
      } else if (value is Map) {
        // handle nested fields: ayah.nomor_telepon, ibu.email, dll
        value.forEach((subField, subValue) {
          final key = '$field.$subField';
          parsedErrors[key] = List<String>.from(subValue);
        });
      }
    });

    return ValidationErrorModel(
      message: json['message'] ?? 'Validation Error',
      errors: parsedErrors,
    );
  }
}
