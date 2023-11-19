class Constants {
  static const String domain = '192.168.1.114:80';
  static const String host = 'http://$domain';
  static const String endpoint = '$host/';
  static const String media = '$host/media/';
}

enum SMSType { registration, login }
