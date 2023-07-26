extension StringExtension on String {
  String withUpper() 
    => substring(0, 1).toUpperCase() + substring(1);

  String addZero(int maxLength) {
    final res = maxLength - length;
    if (maxLength == 0 || res == 0) return this;
    return '${_generator(res)}$this ';
  }

  String _generator(int length) {
    String toReturn = '';
    while (toReturn.length < length) {
      toReturn += '0';
    }
    return toReturn;
  }

}