import 'dart:convert';

import 'package:adv_flutter_lab/lab_11/api/api_service.dart';
import 'package:adv_flutter_lab/lab_11/mvc/model.dart';
import 'package:adv_flutter_lab/utils/import_export.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var usersList = <Model>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading;
      var response = await http.get(
        Uri.parse("https://67d69555286fdac89bc2542a.mockapi.io/users"),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        usersList.value = data.map((json) => Model.fromJson(json)).toList();
      }else{
        Get.snackbar("Error", "Failed to load users");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }
}
