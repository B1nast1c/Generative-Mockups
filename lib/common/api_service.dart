import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interfaces/common/constants.dart';

class ApiService {
  Future<List<String>> getLabels() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.labelsEndpoint);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<String> items = (data['name'] as List).cast<String>();
      return items;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
