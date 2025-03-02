import 'package:si_assessment/core/api_client.dart';
import 'package:si_assessment/models/match_model.dart';

class MatchRepository {
  final AppHttpClient _httpClient;

  MatchRepository(this._httpClient);

  Future<MatchModel> fetchMatchDetails(String matchId) async {
    final response = await _httpClient.get(endPoint: "$matchId.json");
    if (response.response.statusCode == 200) {
      return MatchModel.fromJson(response.getJsonDecoded());
    } else {
      throw Exception("Failed to load match details");
    }
  }
}
