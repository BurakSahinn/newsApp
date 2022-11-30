import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/news_model/news_model.dart';
import 'package:news_app/services/base_service_requests.dart';

class HomeServices {
  Future<NewsModel?> getNewsFromService(String requestUrl) async {
    try {
      Response? response = await BaseServiceRequests.getRequest(requestUrl);

      if (response != null && response.body.isNotEmpty) {
        Map<String, dynamic> responseData = json.decode(response.body);
        NewsModel newsModel = NewsModel.fromJson(responseData);
        return newsModel;
      } else {
        NewsModel newsModel = NewsModel(
          articles: null,
          status: "ok",
          totalResults: 0,
        );
        return newsModel;
      }
    } catch (e) {
      NewsModel newsModel = NewsModel(
        articles: null,
        status: "ok",
        totalResults: 0,
      );
      return newsModel;
    }
  }
}
