import 'package:intl/intl.dart';

class DateTimeConst {
  static DateTime get nullDate => DateTime(1900);
  // ignore: constant_identifier_names
  static const String DATE_TIME_FORMAT = 'yyyy-MM-ddTHH:mm:ss';
  // ignore: constant_identifier_names
  static const String DATE_FORMAT = 'dd/MM/yyyy';
  // ignore: constant_identifier_names
  static const String DATE_2_FORMAT = 'yyyy-MM-dd';
  // ignore: constant_identifier_names
  static const String DATE_3_FORMAT = 'MM/dd/yyyy';
  // ignore: constant_identifier_names
  static const String U_MINUTE_FORMAT = 'HH:mm, dd/MM/yyyy';
  // ignore: constant_identifier_names
  static const String U_SECOND_FORMAT = 'dd/MM/yyyy HH:mm:ss';
}

// ignore: avoid_classes_with_only_static_members
class DateTimeUtils {
  static var nullDate = DateTimeConst.nullDate;

  static String getFormattedDateTime({required DateTime dateTime}) {
    final day = '${dateTime.day}';
    final month = '${dateTime.month}';
    final year = '${dateTime.year}';

    // String hour = '${dateTime.hour}';
    // String minute = '${dateTime.minute}';
    // String second = '${dateTime.second}';
    //return '$day/$month/$year $hour/$minute/$second';
    return '$day/$month/$year';
  }

  static String formatDateTime(Object? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String? time;
    if (dateTime is String) {
      if (dateTime.toString().trim() == '') {
        time = '';
      } else {
        time = dateTime.toString();
        final date = DateFormat(DateTimeConst.DATE_TIME_FORMAT).parse(time);
        time = DateFormat(DateTimeConst.U_MINUTE_FORMAT).format(date);
      }
    } else if (dateTime is DateTime) {
      time = DateFormat(DateTimeConst.U_MINUTE_FORMAT).format(dateTime);
    }
    return time ?? '';
  }

  static String formatDate(Object? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String? time;
    if (dateTime is String) {
      if (dateTime.toString().trim() == '') {
        time = '';
      } else {
        time = dateTime.toString();
        final date = DateFormat(DateTimeConst.DATE_TIME_FORMAT).parse(time);
        time = DateFormat(DateTimeConst.DATE_FORMAT).format(date);
      }
    } else if (dateTime is DateTime) {
      time = DateFormat(DateTimeConst.DATE_FORMAT).format(dateTime);
    }
    return time ?? '';
  }

  static String formatDateV2(Object? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String? time;
    if (dateTime is String) {
      if (dateTime.toString().trim() == '') {
        time = '';
      } else {
        time = dateTime.toString();
        final date = DateFormat(DateTimeConst.DATE_TIME_FORMAT).parse(time);
        time = DateFormat(DateTimeConst.DATE_3_FORMAT).format(date);
      }
    } else if (dateTime is DateTime) {
      time = DateFormat(DateTimeConst.DATE_3_FORMAT).format(dateTime);
    }
    return time ?? '';
  }

  static String formatMoth(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String time;
    time = '${dateTime.month}/${dateTime.year}';
    return time;
  }
}
