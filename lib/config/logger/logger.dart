import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    colors: true,
    printEmojis: false,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
);
