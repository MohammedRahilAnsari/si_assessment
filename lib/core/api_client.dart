import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class RawApiResponse {
  final http.Response response;
  final String? error;

  RawApiResponse(this.response, {this.error});

  Map<String, dynamic> getJsonDecoded() {
    return json.decode(response.body);
  }
}

class AppHttpClient {
  final String baseUrl;
  final http.Client client;

  AppHttpClient(this.baseUrl, this.client);

  Future<RawApiResponse> _handleResponse(http.Response response, String path) async {
    if (response.statusCode == 200) {
      return RawApiResponse(response);
    } else {
      log("API Error: ${response.statusCode} - ${response.body}");
      throw Exception("API Error: ${response.statusCode}");
    }
  }

  Future<RawApiResponse> get({required String endPoint, Map<String, String>? headers}) async {
    try {
      final uri = '$baseUrl$endPoint';

      final response = await client.get(Uri.parse(uri), headers: headers);
      log('RawApiResponse-Get :: responseCode : ${response.statusCode} ||\nurl : $uri || \nresponse :  ${response.body}');
      return await _handleResponse(response, endPoint);
    } catch (e) {
      log("GET Request Failed: $e");
      throw Exception('GET Request Failed: $e');
    }
  }
}