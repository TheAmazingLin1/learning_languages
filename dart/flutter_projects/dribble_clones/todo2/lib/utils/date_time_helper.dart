String getWeekday() {
  final weekday = DateTime.now().weekday;
  switch (weekday) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    case 7:
      return "Sunday";
  }
  return "";
}

String getMonth({int length = 3}) {
  final monthNum = DateTime.now().month;
  String? month;
  switch (monthNum) {
    case 1:
      month = "January";
      break;
    case 2:
      month = "February";
      break;
    case 3:
      month = "March";
      break;
    case 4:
      month = "Aprrl";
      break;
    case 5:
      month = "May";
      break;
    case 6:
      month = "June";
      break;
    case 7:
      month = "July";
      break;
    case 8:
      month = "August";
      break;
    case 9:
      month = "September";
      break;
    case 10:
      month = "October";
      break;
    case 11:
      month = "November";
      break;
    case 12:
      month = "December";
      break;
  }
  return month?.substring(0, length) ?? "";
}

String getDateString() {
  final now = DateTime.now();
  return "${getMonth()} ${now.day} ${now.year}";
}
