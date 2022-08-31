import 'dart:convert';
import 'dart:io';

import '../model/api_model.dart';
import 'package:http/http.dart' as http;

import '../model/firebase_model.dart';
import 'model_cotroler.dart';

class RepoApi {
  static Future<int> fetchWorldState() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      // var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        //ApiDataModel model = ApiDataModel.fromJson(data);
        ApiDataModel model = apiDataModelFromMap(response.body);
        print('=======> in repo length = ${model.products.length}');
        ModelController.model = model;
        print(
            '=======> in after repo length = ${ModelController.model.products.length}');

        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on SocketException catch (e) {
      return 502;
    }
  }
}
