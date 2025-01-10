class ProfileValidator {
  static String? validateName(String value) {
    if (value == null || value.isEmpty) {
      return 'nama lengkap tidak boleh kosong';
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'nama lengkap tidak boleh mengandung angka';
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'nama lengkap tidak boleh mengandung simbol';
    }
    if (value.length < 3) {
      return 'Nama harus terdiri dari minimal 3 karakter.';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'email tidak boleh kosong';
    }
    if (!value.contains('@')) {
      return 'email tidak valid';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    if (value.length < 11 && value.length > 13) {
      return 'Nomor telepon minimal 11 number';
    }
    if (value.length > 13) {
      return 'Nomor telepon maksimal 13 number';
    }
    return null;
  }

  static String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Alamat tidak boleh kosong';
    }
    return null;
  }
}
