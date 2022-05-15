import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String? _url;
  set url(String url) => _url = url;

  NetworkHelper(this._url);

  Future getData() async {
    if (_url != null) {
      http.Response response = await http.get(Uri.parse(_url!));
      if (response.statusCode == 200) {
        log("success fetch data from server");
        String data = response.body;
        return jsonDecode(data);
      } else {
        log(response.statusCode.toString());
      }
    }
  }
}
