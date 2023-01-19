import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../dialogs/error_dialog.dart';
import 'constants.dart';

Future<http.Response> sendToApiGet({int limit = 10, int page = 1}) async {
  return http.get(
    // Uri.parse("$baseUrl?limit=$limit&page=$page"),
    Uri.parse("https://dummyapi.io/data/v1/user?page=$page&limit=$limit"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      'app-id': '63a1bc389b321f540ac5261e'
    },
  );
}

bool handleApiResponse(http.Response response) {
  if ((response.statusCode).toString()[0] == '2') {
    return true;
  } else if (response.statusCode == 401) {
    Get.dialog(ErrorDialog('Unauthenticated!', () {
      Get.close(1);
    }, true, true));
  } else if (response.statusCode == 400) {
    Get.dialog(ErrorDialog('Bad request', () {
      Get.close(1);
    }, true, true));
  } else if (response.statusCode == 403) {
    Get.dialog(ErrorDialog(
        'Forbidden! you dont have the authority to enter this page', () {
      Get.close(1);
    }, true, true));
  } else if (response.statusCode == 404) {
    Get.dialog(ErrorDialog('Not Found!', () {
      Get.close(1);
    }, true, true));
  } else if (response.statusCode == 422) {
    Get.dialog(ErrorDialog('Complete all fields', () {
      Get.close(1);
    }, true, true));
  } else {
    Get.dialog(ErrorDialog('Server Error', () {
      Get.close(1);
    }, true, true));
  }
  return false;
}
