// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'package:news_app/models/news_model/news_article_model.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel {
  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<NewsArticleModel>? articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<NewsArticleModel>.from(
            json["articles"].map((x) => NewsArticleModel.fromJson(x))),
      );
}
