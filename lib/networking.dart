// import 'package:cryptoutils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future<dynamic> getData2() async {
    //http.Response response = await http.get(url);
    http.Request response = await http.Request("GET", Uri.parse(url));
    http.StreamedResponse result = await response.send();
//    print(response.body);

    if (result.statusCode == 200) {
      String data = await utf8.decodeStream(result.stream);
      print(data);

      //return jsonDecode(data);
//      return data;
    } else {
      print(result.statusCode);
    }
  }
  Future<dynamic> postData(var Details) async {
    // var Details = "bird with black wings";
    print(Details);
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(Details));
    print(response);
    print(response.body);
//    String base64 = CryptoUtils.bytesToBase64(response.body);
    // var image = base64.decode(response.body);
    // print(image);
//    Uint8List bytes = base64.decode(response.body.toString());
//    print(image);

  //  return response.body;
  }
}
