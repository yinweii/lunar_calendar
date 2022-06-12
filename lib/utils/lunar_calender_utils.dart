// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

var PI = pi;

dynamic intConvert(double d) {
  return d.toInt();
}

/* Compute the (integral) Julian day number of day dd/mm/yyyy, i.e., the number 
 * of days between 1/1/4713 BC (Julian calendar) and dd/mm/yyyy. 
 * Formula from http://www.tondering.dk/claus/calendar.html
 */
dynamic jdFromDate(dd, mm, yy) {
  var a, y, m, jd;
  a = intConvert((14 - mm) / 12);
  y = yy + 4800 - a;
  m = mm + 12 * a - 3;
  jd = dd +
      intConvert((153 * m + 2) / 5) +
      365 * y +
      intConvert(y / 4) -
      intConvert(y / 100) +
      intConvert(y / 400) -
      32045;
  if (jd < 2299161) {
    jd = dd +
        intConvert((153 * m + 2) / 5) +
        365 * y +
        intConvert(y / 4) -
        32083;
  }
  return jd;
}
