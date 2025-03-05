class Validator {
  static String? validateField(
      String value, List<String? Function(String)> validators) {
    for (var validator in validators) {
      final result = validator(value);
      if (result != null) {
        return result; // Return the first error message
      }
    }
    return null; // No errors
  }

  static String? required(String value, String message) {
    if (value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? consistOf(String value, int consist, String message) {
    if (value.length != consist) {
      return message;
    }
    return null;
  }

  static String? min(String value, double min, String message) {
    if (value.contains(',')) {
      return "Tidak Bisa Menggunakan Koma"; // Pastikan koma terdeteksi lebih awal
    }

    double? number = double.tryParse(value);
    if (number == null || number < min) {
      return message;
    }
    return null;
  }

  static String? max(String value, double max, String message) {
    if (value.contains(',')) {
      return "Tidak Bisa Menggunakan Koma"; // Pastikan koma terdeteksi lebih awal
    }

    double? number = double.tryParse(value);
    if (number == null || number > max) {
      return message;
    }
    return null;
  }

  static String? cannotNumber(String value, String message) {
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? cannotSymbol(String value, String message) {
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String value, String message) {
    if (!value.contains('@')) {
      return message;
    }
    return null;
  }

  static String? mustContainsCapitalize(String value, String message) {
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? mustContainsLowerCase(String value, String message) {
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? mustContainsNumber(String value, String message) {
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? cannotComa(String value, String message) {
    // Cek apakah terdapat koma dalam value
    if (value.contains(',')) {
      return message; // Kembalikan pesan error jika terdapat koma
    }
    return null; // Kembalikan null jika valid
  }

  static String? mustContainsSymbol(String value, String message) {
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? compareValues(
      String value, String compareValue, String message) {
    if (value != compareValue) {
      return message;
    }
    return null;
  }
}
