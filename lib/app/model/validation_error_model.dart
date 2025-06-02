class ValidationErrorModel {
  final String? statusCode;
  final String message;
  final Map<String, List<String>>? errors;

  ValidationErrorModel({
    this.statusCode,
    required this.message,
    this.errors,
  });

  factory ValidationErrorModel.fromJson(Map<String, dynamic> json) {
    final parsedErrors = <String, List<String>>{};

    // Cek apakah `errors` ada dan valid
    if (json['errors'] is Map<String, dynamic>) {
      final rawErrors = json['errors'] as Map<String, dynamic>;

      rawErrors.forEach((field, value) {
        if (value is List) {
          parsedErrors[field] = List<String>.from(value);
        } else if (value is Map) {
          // untuk nested field seperti "ayah.nomor_telepon"
          value.forEach((subField, subValue) {
            final key = '$field.$subField';
            if (subValue is List) {
              parsedErrors[key] = List<String>.from(subValue);
            }
          });
        }
      });
    }

    return ValidationErrorModel(
      statusCode: json['statusCode']?.toString(),
      message: json['message'] ?? 'Validation Error',
      errors: parsedErrors.isEmpty ? null : parsedErrors,
    );
  }
}
