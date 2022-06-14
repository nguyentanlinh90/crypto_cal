import 'package:intl/intl.dart';

class Utils {
  static String formatEntry(double entry) {
    var formatter = NumberFormat('#,##,000');
    return formatter.format(entry);
  }
}