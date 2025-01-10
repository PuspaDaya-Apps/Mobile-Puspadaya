class PasswordValidator {
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Kata sandi harus minimal 8 karakter';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Kata sandi harus mengandung huruf besar';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Kata sandi harus mengandung huruf kecil';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Kata sandi harus mengandung angka';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Kata sandi harus mengandung simbol';
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? newPassword, String confirmPassword) {
    if (newPassword == null || newPassword.isEmpty) {
      return 'Konfirmasi kata sandi tidak boleh kosong';
    }
    if (newPassword != confirmPassword) {
      return 'Kata sandi tidak cocok';
    }
    if (confirmPassword.length < 8) {
      return 'Kata sandi harus minimal 8 karakter';
    }
    if (!RegExp(r'[A-Z]').hasMatch(confirmPassword)) {
      return 'Kata sandi harus mengandung huruf besar';
    }
    if (!RegExp(r'[a-z]').hasMatch(confirmPassword)) {
      return 'Kata sandi harus mengandung huruf kecil';
    }
    if (!RegExp(r'[0-9]').hasMatch(confirmPassword)) {
      return 'Kata sandi harus mengandung angka';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(confirmPassword)) {
      return 'Kata sandi harus mengandung simbol';
    }
    return null;
  }
}
