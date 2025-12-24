import 'package:intl/intl.dart';

class FormatUtils {
  static double formatMapsPoin (double poin) {
    var f = NumberFormat.decimalPatternDigits(
      locale: 'en_EN',
      decimalDigits: 8
    );
    
    return double.parse(f.format(poin));
  }
}