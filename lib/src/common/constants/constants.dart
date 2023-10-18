class Constants {
  static const String domain = 'localhost:8000';
  static const String host = 'https://$domain';
  static const String endpoint = '$host/api/';
  static const String media = '$host/media/';
}

enum SMSType { registration, login }
