import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get toBrDate => DateFormat('dd/MM/yyyy').format(this);
}
