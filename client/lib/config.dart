import 'dart:convert';
import 'dart:html';
import 'dart:async';

class Config {
  static dynamic _config;

  static Future<dynamic> load() async {
    if (_config == null) {
      var data = await HttpRequest.getString('config.json');
      _config = JSON.decode(data);
    }
    return _config;
  }
}
