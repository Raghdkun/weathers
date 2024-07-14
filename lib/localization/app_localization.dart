import 'package:get/get.dart';
import 'en_us/ar_sy_translations.dart';
import 'en_us/en_us_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': enUs, 'ar': arSy};
}
