import 'package:http/http.dart' as http;
import 'package:ru_app/networks/env.dart';
import 'dart:convert';

class NetworkHelper {
  List<dynamic> cardapio = [];
  List<dynamic> news = [];

  NetworkHelper();

  /// Get data from API
  ///
  /// This method sends a GET request to the API and returns a [Future] that
  /// resolves to a [List] of [Map]s containing the data from the API if the
  /// request is successful.
  ///
  /// The data is stored in the [cardapio] property.
  Future getData() async {
    Uri url = Env.api;
    // Uri url = Uri.parse('http://ru.server.net/api');
    try {
      
      http.Response response = await http.get(
        url,
      );
      // print(response.statusCode);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        cardapio = json;
        return cardapio;
      } else {
        return cardapio;
      }
    } catch (e) {
      return cardapio;
    }
  }

  /// Post user token to API
  ///
  /// This method sends a POST request to the API with the user's token and
  /// returns a [Future] that resolves when the request is complete.
  ///
  /// The [token] parameter is optional and defaults to [null].
  Future postUserToken({String? token}) async {
    Uri url = Env.token;
    // Uri url = Uri.parse('http://ru.server.net/token');

    try {
      await http.post(
        url,
        body: {'token': token},
      );
      // print(res.statusCode);
    } catch (e) {
      // print(e);
    }
  }

  /// Get news from API
  ///
  /// This method sends a GET request to the API and returns a [Future] that
  /// resolves to a [List] of [Map]s containing the news from the API if the
  /// request is successful.
  ///
  /// The news is stored in the [news] property.
  Future getNews() async {
    Uri url = Env.news;
    // Uri url = Uri.parse('http://ru.server.net/api');
    try {
      http.Response response = await http.get(
        url,
      );
      // print(response.statusCode);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        news = json;
        //print(cardapio);
        return news;
      } else {
        // print(response.statusCode);
      }
    } catch (e) {
      // print(e);
      return news;
    }
  }
}
