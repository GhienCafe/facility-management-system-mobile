import 'package:get/get.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        // add this in main dart file
        'en_US': {'email_hint': 'Enter Email'},
        'ur_PK': {'email_hint': 'Enter Email'},
      };
}
