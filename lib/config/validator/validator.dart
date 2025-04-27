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

  static String? required(String value) {
    if (value.isEmpty) {
      return "Isi terlebih dahulu!";
    }
    return null;
  }

  static String? consistOf(String value, int consist, String message) {
    if (value.length != consist) {
      return message;
    }
    return null;
  }

  static String? minLength(String? value, int min, String message,
      {bool nullable = false}) {
    if ((value == null || value.isEmpty)) {
      if (nullable) return null; // Boleh kosong
      return "Isi terlebih dahulu!";
    }
    if (value.length < min) {
      return message;
    }
    return null;
  }

  static String? maxLength(String? value, int max, String message,
      {bool nullable = false}) {
    if ((value == null || value.isEmpty)) {
      if (nullable) return null; // Boleh kosong
      return "Isi terlebih dahulu!";
    }
    if (value.length > max) {
      return message;
    }
    return null;
  }

  static String? minNumber(String? value, double min, String message,
      {bool nullable = false}) {
    if (value == null || value.isEmpty) {
      if (nullable) return null;
      return "Isi terlebih dahulu!";
    }

    if (value.contains(',')) {
      return "Tidak Bisa Menggunakan Koma";
    }

    double? number = double.tryParse(value);
    if (number == null || number < min) {
      return message;
    }
    return null;
  }

  static String? maxNumber(String? value, double max, String message,
      {bool nullable = false}) {
    if (value == null || value.isEmpty) {
      if (nullable) return null;
      return "Isi terlebih dahulu!";
    }

    if (value.contains(',')) {
      return "Tidak Bisa Menggunakan Koma";
    }

    double? number = double.tryParse(value);
    if (number == null || number > max) {
      return message;
    }
    return null;
  }

  static String? rangeNumber(
    String? value,
    double min,
    double max,
    String message, {
    bool nullable = false,
  }) {
    if (value == null || value.isEmpty) {
      if (nullable) return null;
      return "Isi terlebih dahulu!";
    }

    if (value.contains(',')) {
      return "Tidak Bisa Menggunakan Koma";
    }

    double? number = double.tryParse(value);
    if (number == null || number < min || number > max) {
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

  static String? mustPositiveNumber({required String value, bool? nullabel}) {
    double? number = double.tryParse(value);

    if(nullabel == null && value.isNotEmpty) {
      if(number != null) {
        if(number <= 0) {
          return "Angka harus positif";
        } else{
          null;
        }
      } else {
        return "Inputan tidak benar";
      }
    } 

   return null;
  }
}
