import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;


class ItemRepo {
  static const PREFIX_URL = "http://192.168.10.16:8182/api/public";
  int page = 0;
  static const PAGE_SIZE = 100;


  Stream<ListItem>get() async* {
    var url = "$PREFIX_URL/find-all?page=$page&pageSize=$PAGE_SIZE";

    try {
      var res = await http.get(url).timeout(Duration(seconds: 5));
      if (res.statusCode == 200) {
        yield ListItem.fromJson(json.decode(res.body));
      } else {
        throw Exception("Status code: ${res.statusCode}. Exception details: ${res.body}");
      }
    }catch (e) {
      throw Exception(e.toString());
    }


  }
}