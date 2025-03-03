import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:si_assessment/models/match_model.dart';

/// Squad Notifier (Manages Player Filtering & Sorting)
class SquadNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  final MatchModel match;
  String selectedTeam = "All";

  SquadNotifier(this.match) : super([]) {
    _fetchSquad(selectedTeam);
  }

  /// Fetch & Sort Players (Called When Team Changes)
  void _fetchSquad(String team) {
    List<Map<String, dynamic>> playersWithTeams = [];
    final teamList = match.teams?.values.toList() ?? [];

    if (team == "All") {
      List<Map<String, dynamic>> tempPlayers = [];

      for (var team in teamList) {
        for (var player in team.players?.values ?? []) {
          tempPlayers.add({"teamShort": team.nameShort ?? "UNK", "player": player});
        }
      }

      // Sort players alphabetically
      tempPlayers.sort((a, b) => (a["player"].nameFull ?? "").compareTo(b["player"].nameFull ?? ""));
      playersWithTeams = tempPlayers;
    } else {
      final selectedTeamData = teamList.firstWhere((t) => t.nameFull == team);
      for (var player in selectedTeamData.players?.values ?? []) {
        playersWithTeams.add({"teamShort": selectedTeamData.nameShort ?? "UNK", "player": player});
      }
    }

    state = playersWithTeams; // Update Riverpod State
  }

  /// Change Selected Team & Refresh List
  void changeTeam(String team) {
    selectedTeam = team;
    _fetchSquad(team);
  }
}