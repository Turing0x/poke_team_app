extension StringExtension on String {

  String withUpper() => substring(0, 1).toUpperCase() + substring(1);

}