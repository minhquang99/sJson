import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:searchjson/champ.dart';
import 'dart:convert';

List<Champ> parseChamp(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Champ> champs = list.map((model) => Champ.fromJson(model)).toList();
  return champs;
}

Future<List<Champ>> fetchChamp() async {
  final response = await http.get(Uri.parse("http://10.0.2.2:3000/champions/"));
  if (response.statusCode == 200) {
    return compute(parseChamp, response.body);
  } else {
    throw Exception('Errorrr');
  }
}
