import 'package:get/get.dart';

class BBTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    var map = {
      'EDIT_PROFILE': 'একাউন্ট পরিবর্তন',
      'ACCOUNT_TYPE_SELECTION': 'আপনার অ্যাকাউন্ট নির্বাচন করুন',

    };
    return {
      'en_US': {
        'ACCOUNT_TYPE_SELECTION': 'Please select your account',
        'EDIT_PROFILE': 'Edit Profile'
      },
      'bn_BD': map
    };
  }
}
