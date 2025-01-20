class PengukuranAnakValidator {
  static String? validateNama(String value) {
    if (value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }
}
