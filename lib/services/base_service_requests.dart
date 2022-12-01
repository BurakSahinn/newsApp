import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseServiceRequests {
  static Future<http.Response?> getRequest(String path) async {
    try {
      Uri apiAddress = Uri.parse(path);
      http.Response response = await http.get(apiAddress);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
