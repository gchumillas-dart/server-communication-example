import 'dart:async';
import 'dart:html';

import 'package:angular2/router.dart';
import 'package:angular2/core.dart';

import 'package:list/services/edit_service.dart';
import 'package:list/entities/item_entity.dart';

@Component(
    selector: 'edit-item-component',
    templateUrl: 'edit_item_component.html',
    styleUrls: const ['edit_item_component.css'])
class EditItemComponent implements OnInit {
  final EditService _editService;
  final RouteParams _params;
  ItemEntity item;

  EditItemComponent(this._editService, this._params);

  Future<Null> ngOnInit() async {
    // fetches the item from db
    final id = _params.get('id');
    item = await _editService.getItemById(id);
  }

  Future<Null> onSubmit() async {
    await _editService.saveItem(item);
    goBack();
  }

  void goBack() => window.history.back();
}
