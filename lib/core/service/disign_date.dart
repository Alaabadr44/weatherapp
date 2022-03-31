import 'package:jiffy/jiffy.dart';

String designHour(DateTime dateTime) {
  return Jiffy(dateTime).j;
}

String designDey(String x) {
DateTime  dateTime = DateTime.parse(x);
  return Jiffy(dateTime).yMMMMd;
}
