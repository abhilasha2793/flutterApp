import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dummy_app/models/Todo.dart';
import 'api_constants.dart';
import 'package:http/http.dart' as http;

/// A class for making api service call to fetch todo list from server

class ApiService {


  Future<List<Todo>> getTodos() async {
    try {
      var url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.todos);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> mapResponse = json.decode(response.body);
        return mapResponse.map((json) => Todo.fromJson(json)).toList().sublist(0,5);
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
