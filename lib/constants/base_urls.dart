import 'package:news_app/constants/general_datas.dart';

class BaseUrls {
  static String baseUrl = "https://newsapi.org/v2/";

  static String topNewsUrl =
      "${baseUrl}top-headlines?country=us&apiKey=${GeneralData.apiKey}";
}
