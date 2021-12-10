import 'package:get/get.dart';

class BBTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    var map = {
      'EDIT_PROFILE': 'একাউন্ট পরিবর্তন',
      'ACCOUNT_TYPE_SELECTION': 'আপনার অ্যাকাউন্ট নির্বাচন করুন',
      'USER': 'ইউজার',
      'ADMIN': 'এডমিন',
      'POLICE': 'পুলিশ',
      'CONTINUE': 'এগিয়ে যান',
      'User Login': 'ইউজার লগইন',
      'Police Login': 'পুলিশ লগইন',
      'Admin Login': 'এডমিন লগইন',
      'Log In': 'লগইন',
      'LOG IN': 'লগইন',

      'Batch Number': 'ব্যাচ নাম্বার',
      'Enter Your Batch Number': 'আপনার ব্যাচ নাম্বারটি দিন',
      'Please Enter Your Batch Number': 'অনুগ্রহ করে ব্যাচ নাম্বার দিন'
    };
    return {
      'en_US': {
        'ACCOUNT_TYPE_SELECTION': 'Please select your account',
        'EDIT_PROFILE': 'Edit Profile',
        'USER': 'User',
        'ADMIN': 'Admin',
        'POLICE': 'Police',
        'CONTINUE': 'Continue',
        'User Login': 'User Login',
        'Police Login': 'Police Login',
        'Admin Login': 'Admin Login',
        'Log In': 'Log In',
        'LOG IN': 'Log In',
        'Batch Number': 'Batch Number',
        'Enter Your Batch Number': 'Enter Your Batch Number',
        'Please Enter Your Batch Number': 'Please Enter Your Batch Number'
      },
      'bn_BD': map
    };
  }
}
