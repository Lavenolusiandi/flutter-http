import 'dart:convert';
import 'package:flutter_application_1/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://653d045cd5d6790f5ec883cc.mockapi.io/blog';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        // ignore: unused_local_variable
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
