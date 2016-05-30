import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:domquery/utils.dart';

import 'package:list/config.dart';
import 'package:list/entities/item_entity.dart';

@Injectable()
class ListService {
  String _controller = 'list.php';

  Future<List<ItemEntity>> getItems() async {
    final config = await Config.load();
    final url = config['server'] + '/$_controller';
    final data = await HttpRequest.getString(url);
    return _getItemsFromData(data);
  }

  Future<List<ItemEntity>> deleteItem(ItemEntity item) async {
    final config = await Config.load();
    // TODO: url builder
    final url = config['server'] + '/$_controller';
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
