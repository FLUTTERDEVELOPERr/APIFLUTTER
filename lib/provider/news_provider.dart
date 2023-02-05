import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_web/models/news_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

final newsProvider = FutureProvider<List<NewsModel>>((ref) async {
  var url = Uri.parse('https://api.sampleapis.com/futurama/characters');

  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  var response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    print(response.body);
    List<NewsModel> jsonList = newsModelFromJson(response.body);
    return jsonList;
  } else {
    throw Exception(["Response from API null"]);
  }
});
