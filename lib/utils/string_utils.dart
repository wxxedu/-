part of 'index.dart';

extension StringX on String {
  String get capitalized => '${this[0].toUpperCase()}${substring(1)}';
}
