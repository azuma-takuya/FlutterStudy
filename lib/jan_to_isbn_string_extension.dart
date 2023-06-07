const int janCodeLength = 13;
const int startIsbnIndex = 3;
const int endIsbnIndex = 12;
const int checkDigitModulo = 11;
const int checkDigitXValue = 10;

extension JanToIsbnStringExtension on String {
  String convertJanToIsbn() {

    if (length != janCodeLength) {
      throw const FormatException('不正なJANコードです');
    }

    var isbn = substring(startIsbnIndex, endIsbnIndex);
    var checkDigit = 0;

    final isbnList = isbn.split('');

    try {
      checkDigit = isbnList.asMap().entries.map((e) {
        return int.parse(e.value) * (e.key + 1);
      }).reduce((value, element) => value + element);
    } on FormatException {
      throw const FormatException('不正なJANコードです');
    }

    checkDigit %= checkDigitModulo;

    isbn += (checkDigit == checkDigitXValue) ? 'X' : checkDigit.toString();

    return isbn;
  }
}
