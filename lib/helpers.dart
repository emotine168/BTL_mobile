import 'package:intl/intl.dart';


int priceToNumber(String price) {
  var str = price.substring(0, price.length - 1);
  var str1 = str.split('.');
  var str2 = str1.join('');
  return int.parse(str2);
}

String numberToPrice(int number) {
  var arr = [];
  var str = number.toString();
  for (var i = str.length - 1; i >= 0; i -= 3) {
    if (i < 2) {
      arr.add(str.substring(0, i + 1));
    } else {
      arr.add(str.substring(i - 2, i + 1));
    }
  }
  var reversedList = new List.from(arr.reversed);
  var res = reversedList.join('.');
  var res1 = res + "₫";
  return res1;
}

double percentToNumber(String percent) {
  if (percent != null && percent.length > 0) {
    percent = percent.substring(0, percent.length - 1);
  }
  return int.parse(percent) / 100;
}

String formatDateTimetoTime(DateTime dt) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(dt);
  return formatted;
}

String lengthToKilometers(int length) {
  String rs = (length / 1000).toStringAsFixed(1);
  return '${rs} km';
}

int distanceToMoney(int length) {
  int l = (length/1000).toInt();
  if (l < 15) {
    if(l<=3) return 10000;
    else return 10000 + 3000 * (l-3);
  }
  else if(l >= 15 ) return 35000;
}
