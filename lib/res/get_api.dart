

import 'dart:convert';

import 'package:blocs/models/post_model.dart';
import 'package:http/http.dart' as http;

class GetApiRepository{

  Future<Map<String, dynamic>> getData() async {
    var user_id = '195';
    var login_code = '1';
    var params = {'user_id': user_id, 'login_code': login_code};

    ///Api
    String apiUrl = 'https://digitance.turk.pk/super_api/get_attenance_hr.php';
    final response = await http.post(Uri.parse(apiUrl), body: params);
     try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}