import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:domquery/utils.dart';

import 'package:list/entities/item_entity.dart';
import 'package:list/services/config_service.dart';

@Injectable()
class ListService {
  final ConfigService _config;
  String _controller = 'list.php';

  ListService(this._config);

  Future<List<ItemEntity>> getItems() async {
    final url = await _config.getControllerUrl(_controller);
    final data = await HttpRequest.getString(url);
    return _getItemsFromData(data);
  }

  Future<List<ItemEntity>> deleteItem(ItemEntity item) async {
    final url = await _config.getControllerUrl(_controller);
    final req = await HttpRequest
        .postFormData(url, {'action': 'delete', 'id': item.id});
    return _getItemsFromData(req.responseText);
  }

  List<ItemEntity> _getItemsFromData(String data) {
    final ret = new List<ItemEntity>();
    final root = new DomNode.fromString(data);
    final items = root.query('item');
    items.forEach((DomNode item) {
      ret.add(new ItemEntity(item.attr('id'), item.attr('title'), item.text()));
    });
    return ret;
  }
}
