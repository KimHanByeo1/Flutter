import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_study/model.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var model = <Model>[].obs;

  getJSONData() async {
    var response = await http
        .get(Uri.parse('https://zeushahn.github.io/Test/student.json'));
    var dateConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dateConvertedJSON['results'];
    var res = result.map((e) => Model.fromJson(e)).toList();

    model.value = res;
  }
}
