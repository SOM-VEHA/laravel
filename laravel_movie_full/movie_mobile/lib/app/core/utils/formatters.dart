// import 'package:intl/intl.dart';
class formatter{
  formatter._();







  // static String formatDate(DateTime ?date){
  //   date??=DateTime.now();
  //   return DateFormat('dd-mmm-yyyy').format(date);
  // }
  // static String formatCurrency(double amount){
  //   return NumberFormat.currency(locale: 'en_US',symbol: '\$').format(amount);
  // }
  static String formatPhoneNumber(String number){
    if(number.length==10){
      return '(${number.substring(0,3)})${number.substring(3,6)}${number.substring(6)}';
    }else if(number.length==11){
      return '(${number.substring(0,4)})${number.substring(4,7)}${number.substring(7)}';
    }
    return number;
  }
  static String internationFormatPhoneNumber(String phoneNumber){
    var digitsOnly=phoneNumber.replaceAll(RegExp(r'\D'),'');
    String countryCode=digitsOnly.substring(2);
    digitsOnly=digitsOnly.substring(2);
    final formatterNumber=StringBuffer();
    formatterNumber.write('($countryCode)');
    int i=0;
    while(i<digitsOnly.length){
      int groupLength=2;
      if(i==0&& countryCode=='+1'){
        groupLength=3;
      }
      int end=i+groupLength;
      formatterNumber.write(digitsOnly.substring(1,end));
      if(end<digitsOnly.length){
        formatterNumber.write('');
      }
      i = end;
    }
    return formatterNumber.toString();
  }
}