import 'dart:convert';
import 'dart:developer';

import 'package:bitcoin_ticker/util/constant.dart';
import 'package:http/http.dart';

class CoinNetwork {
  Future<dynamic> getBTC(String currency, String crypto) async {
    var response = await get(Uri.parse("$coinAPI_URL/$crypto/$currency/"),
        headers: {'X-CoinAPI-Key': API_KEY});
    if (response.statusCode == 200) {
      log('success fetch coin data');
    } else {
      log(response.statusCode.toString());
    }
    return jsonDecode(response.body);
  }
}
