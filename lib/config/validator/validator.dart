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

  static String? min(String value, int min, String message) {
    if (value.length < min) {
      return message;
    }
    return null;
  }

  static String? max(String value, int max, String message) {
    if (value.length > max) {
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

  static String? valudateEmail(String value, String message) {
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

  static String? mustContainsSymbol(String value, String message) {
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? compareValue(
      String value, String compareValue, String message) {
    if (value != compareValue) {
      return message;
    }
  }
}
