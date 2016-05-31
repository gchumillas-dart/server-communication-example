import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:domquery/utils.dart';

import 'package:list/entities/item_entity.dart';
import 'package:list/services/config_service.dart';

@Injectable()
class EditService {
  final ConfigService _config;
  String _controller = 'edit.php';

  EditService(this._config);

  Future<ItemEntity> getItemById(String id) async {
    final url = await _config.getControllerUrl(_controller);
    final data = await HttpRequest.getString(url);
    return _getItemFromData(data);
  }

  Future<ItemEntity> editItem(ItemEntity item) async {
    final url = await _config.getControllerUrl(_controller);
    final req = await HttpRequest.postFormData(url,
        {'id': item.id, 'title': item.title, 'description': item.description});
    return _getItemFromData(req.responseText);
  }

  ItemEntity _getItemFromData(String data) {
    final root = new DomNode.fromString(data);
    return new ItemEntity(root.query('id').text(), root.query('title').text(),
        root.query('description').text());
  }
}
