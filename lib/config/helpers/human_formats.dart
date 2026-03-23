


import 'package:intl/intl.dart';

class HumanFormats {

  static String number( double number ){

    String outputNumber = number.toString();
    String outputFormatted = outputNumber.replaceAll('.', '').replaceAll(',', '.');
    number = double.parse(outputFormatted).abs();


    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
      locale: 'en'
    ).format(number);

    return formattedNumber;

  }

  static String numberDecimal( double number ){

    final formattedNumber = NumberFormat.decimalPatternDigits(
      decimalDigits: 1,
      locale: 'en'
    ).format(number);

    return formattedNumber;
  }


}