import 'package:intl/intl.dart';

class DateTimeUtil {
  static final DateFormat df = DateFormat('yyyy-MM-dd HH:mm');
  static final DateFormat ddMMyyyyInstant = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static String formatDateTimeToStr(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    return df.format(dateTime);
  }

  static String dateToInstantStr(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    return "${ddMMyyyyInstant.format(dateTime)}.000Z";
  }
}
