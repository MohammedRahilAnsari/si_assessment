import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:si_assessment/models/match_model.dart';
import 'package:si_assessment/widgets/custom_background.dart';
import 'package:si_assessment/widgets/custom_drop_down_widget.dart';
import 'package:si_assessment/widgets/custom_player_details_widget.dart';
import 'package:si_assessment/widgets/custom_app_bar.dart';
import '../providers/squad_provider.dart';
import '../viewmodels/squad_viewmodel.dart';

class SquadScreen extends ConsumerWidget {
  final MatchModel match;

  const SquadScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final squadState = ref.watch(squadProvider(match));
    final squadNotifier = ref.read(squadProvider(match).notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Squads"),
      body: CustomBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildDropdown(theme, squadNotifier),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  itemCount: squadState.length,
                  itemBuilder: (context, index) {
                    final teamShortName = squadState[index]["teamShort"];
                    final Player player = squadState[index]["player"];
                    return _buildPlayerCard(context, player, teamShortName, theme);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Dropdown Widget**
  Widget _buildDropdown(ThemeData theme, SquadNotifier squadNotifier) {
    return CustomDropDownWidget<String>(
      selectedValue: squadNotifier.selectedTeam,
      items: ["All", ...squadNotifier.match.teams!.values.map((t) => t.nameFull ?? "Unknown")],
      onChanged: (value) => squadNotifier.changeTeam(value!),
      itemLabel: (team) => team,
    );
  }

  /// **Player Card**
  Widget _buildPlayerCard(BuildContext context, Player player, String teamShortName, ThemeData theme) {
    return GestureDetector(
      onTap: () => PlayerDetailsSheet.show(context, player),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.cardColor.withOpacity(0.85),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: theme.primaryColor.withOpacity(0.8),
              child: Text(teamShortName, style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                player.getFormattedPlayerName(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color),
              ),
            ),
            Icon(Icons.info_outline, color: theme.iconTheme.color),
          ],
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:si_assessment/models/match_model.dart';
// import 'package:si_assessment/widgets/custom_background.dart';
// import 'package:si_assessment/widgets/custom_drop_down_widget.dart';
// import 'package:si_assessment/widgets/custom_row_widget.dart';
// import 'package:si_assessment/widgets/custom_app_bar.dart';
//
// import '../widgets/custom_player_details_widget.dart';
//
// class SquadScreen extends StatefulWidget {
//   final MatchModel match;
//
//   const SquadScreen({super.key, required this.match});
//
//   @override
//   State<SquadScreen> createState() => _SquadScreenState();
// }
//
// class _SquadScreenState extends State<SquadScreen> {
//   String selectedTeam = "All";
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final teamList = widget.match.teams?.values.toList() ?? [];
//
//     List<Map<String, dynamic>> playersWithTeams = [];
//     if (selectedTeam == "All") {
//       List<Map<String, dynamic>> tempPlayers = [];
//
//       for (var team in teamList) {
//         for (var player in team.players?.values ?? []) {
//           tempPlayers.add({"teamShort": team.nameShort ?? "UNK", "player": player});
//         }
//       }
//
//       //Sort players alphabetically by full name
//       tempPlayers.sort((a, b) => (a["player"].nameFull ?? "").compareTo(b["player"].nameFull ?? ""));
//
//       playersWithTeams = tempPlayers;
//     }else {
//       final selectedTeamData = teamList.firstWhere((team) => team.nameFull == selectedTeam);
//       for (var player in selectedTeamData.players?.values ?? []) {
//         playersWithTeams.add({"teamShort": selectedTeamData.nameShort ?? "UNK", "player": player});
//       }
//     }
//
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: const CustomAppBar(title: "Squads"),
//       body: CustomBackground(
//         child: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: _buildDropdown(theme, teamList),
//               ),
//               const SizedBox(height: 12),
//               Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                   itemCount: playersWithTeams.length,
//                   itemBuilder: (context, index) {
//                     final teamShortName = playersWithTeams[index]["teamShort"];
//                     final Player player = playersWithTeams[index]["player"];
//                     return _buildPlayerCard(context, player, teamShortName, theme);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Dropdown Widget
//   Widget _buildDropdown(ThemeData theme, List<Team> teamList) {
//     return CustomDropDownWidget<String>(
//       selectedValue: selectedTeam,
//       items: ["All", ...teamList.map((t) => t.nameFull ?? "Unknown")],
//       onChanged: (value) => setState(() => selectedTeam = value!),
//       itemLabel: (team) => team,
//     );
//   }
//
//   /// Player Card
//   Widget _buildPlayerCard(BuildContext context, Player player, String teamShortName, ThemeData theme) {
//     return GestureDetector(
//       onTap: () => PlayerDetailsSheet.show(context, player),
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: theme.cardColor.withOpacity(0.85),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
//           boxShadow: [
//             BoxShadow(
//               color: theme.shadowColor.withOpacity(0.3),
//               blurRadius: 15,
//               spreadRadius: 1,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundColor: theme.primaryColor.withOpacity(0.8),
//               child: Text(teamShortName, style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 player.getFormattedPlayerName(),
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color),
//               ),
//             ),
//             Icon(Icons.info_outline, color: theme.iconTheme.color),
//           ],
//         ),
//       ),
//     );
//   }
// }