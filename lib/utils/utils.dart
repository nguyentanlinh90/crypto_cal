import 'dart:developer';

import 'package:intl/intl.dart';

class Utils {
  static String formatEntry(String entry) {
    final numberFormat = NumberFormat("#,###.#######", "en_US");
    return numberFormat.format(double.parse(entry));
  }
}
