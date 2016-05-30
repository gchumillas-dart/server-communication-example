import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:domquery/utils.dart';

import 'package:list/config.dart';
import 'package:list/entities/item_entity.dart';

@Injectable()
class EditService {
  String _controller = 'edit.php';

  Future<ItemEntity> getItemById(String id) async {
    final config = await Config.load();
    // TODO: escape parameters
    final url = config['server'] + '/$_controller?id=' + id;
    final data = await HttpRequest.getString(url);
    return _getItemFromData(data);
  }

  Future<ItemEntity> editItem(ItemEntity item) async {
    final config = await Config.load();
    final url = config['server'] + '/$_controller';
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
