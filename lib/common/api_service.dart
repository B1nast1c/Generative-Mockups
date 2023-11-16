import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interfaces/common/constants.dart';
import 'package:interfaces/common/image_model.dart';

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

  Future<List<ImageModel>> generateImages(String label) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.generateEndpoint);
    var response = await http.post(
      url,
      body: jsonEncode({"label": label.toLowerCase()}),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<ImageModel> items = List<ImageModel>.from(
          data['data'].map((item) => ImageModel.fromJson(item)));
      return items;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
