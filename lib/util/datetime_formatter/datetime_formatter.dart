import 'package:intl/intl.dart';

String formatDateddMMMyyyy(String date) {
  if (date.isEmpty) {
    return '';
  }
  final formattedDate = DateFormat('dd MMM yyyy').format(DateTime.parse(date));
  return formattedDate;
}

String convertTimestampToFormattedString(String? dateTimeString) {
  if (dateTimeString == null) {
    return '';
  }

  DateTime dateTime = DateTime.parse(dateTimeString);

  String formattedDate = DateFormat('MMM dd, HH:mm').format(dateTime);

  String result = formattedDate;

  return result;
}
