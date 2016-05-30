import 'dart:async';
import 'dart:html';

import 'package:angular2/router.dart';
import 'package:angular2/core.dart';

import 'package:list/services/edit_service.dart';
import 'package:list/entities/item_entity.dart';

@Component(selector: 'div.edit-item', templateUrl: 'edit_item_component.html')
class EditItemComponent implements OnInit {
  final EditService _listService;
  final RouteParams _params;
  ItemEntity item;

  EditItemComponent(this._listService, this._params);

  Future<Null> ngOnInit() async {
    // fetches the item from db
    final id = _params.get('id');
    item = await _listService.getItemById(id);
  }

  Future<Null> onSubmit() async {
    await _listService.editItem(item);
    goBack();
  }

  void goBack() => window.history.back();
}
