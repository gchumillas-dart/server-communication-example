import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:list/entities/item_entity.dart';
import 'package:list/services/list_service.dart';

@Component(selector: 'div.list-component', templateUrl: 'list_component.html')
class ListComponent implements OnInit {
  final ListService _listService;
  final Router _router;
  List<ItemEntity> items;

  ListComponent(this._listService, this._router) {}

  Future<Null> ngOnInit() async {
    items = await _listService.getItems();
  }

  void editItem(ItemEntity item) {
    print(item);
  }

  void gotoEditItem([ItemEntity item]) {
    final link = [
      'EditItem',
      {'id': item?.id ?? ''}
    ];
    _router.navigate(link);
  }

  Future<Null> deleteItem(ItemEntity item) async {
    if (window.confirm('Are you sure?')) {
      items = await _listService.deleteItem(item);
    }
  }
}
