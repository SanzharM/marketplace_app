class Constants {
  static const String domain = '192.168.1.114:80';
  static const String host = 'https://$domain';
  static const String endpoint = '$host/api/';
  static const String media = '$host/media/';
}

enum SMSType { registration, login }
