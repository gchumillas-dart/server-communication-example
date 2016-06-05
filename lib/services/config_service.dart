import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular2/core.dart';

@Injectable()
class ConfigService {
  static dynamic _config;

  Future<String> getControllerUrl(String path,
      [Map<String, dynamic> params]) async {
    await _loadConfig();

    // Creates the URI object
    final server =
        _config['server'].toString().replaceAll(new RegExp(r'/+$'), '');
    final uri = Uri.parse('$server/$path');

    // Adds or replaces current parameters.
    final uriParams = new Map<String, String>.from(uri.queryParameters);
    if (params != null) {
      params.forEach((String key, dynamic value) {
        uriParams[key] = value.toString();
      });
    }

    // Returns a clone of the URI with the passed parameters
    return new Uri(
            scheme: uri.scheme,
            userInfo: uri.userInfo,
            host: uri.host,
            port: uri.port,
            path: uri.path,
            queryParameters: uriParams.length > 0 ? uriParams : null,
            fragment: uri.fragment.length > 0 ? uri.fragment : null)
        .toString();
  }

  Future<Null> _loadConfig() async {
    if (_config == null) {
      var data = await HttpRequest.getString('config.json');
      _config = JSON.decode(data);
    }
  }
}
