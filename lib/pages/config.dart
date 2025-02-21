import 'package:demo1/models/general_type.dart';

class Config {
  static const CommonIcon = 'CommonIcon';
  static const BaseUrl = 'http://192.168.100.179:8080';
  static List<GeneralType> availableCitys = [
    GeneralType('北京', 'AREA|88cff55c-aaa4-e2e0'),
    GeneralType('上海', 'AREA|dbf46d32-7e76-1196'),
    GeneralType('深圳', 'AREA|a6649a11-be98-b150'),
    GeneralType('广州', 'AREA|e4940177-c04c-383d'),
  ];
}
