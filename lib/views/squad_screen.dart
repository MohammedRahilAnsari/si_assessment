import 'package:flutter/material.dart';
import 'package:si_assessment/models/match_model.dart';
import 'package:si_assessment/widgets/custom_background.dart';
import 'package:si_assessment/widgets/custom_drop_down_widget.dart';
import 'package:si_assessment/widgets/custom_row_widget.dart';
import 'package:si_assessment/widgets/custom_app_bar.dart';

class SquadScreen extends StatefulWidget {
  final MatchModel match;

  const SquadScreen({super.key, required this.match});

  @override
  State<SquadScreen> createState() => _SquadScreenState();
}

class _SquadScreenState extends State<SquadScreen> {
  String selectedTeam = "All";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final teamList = widget.match.teams?.values.toList() ?? [];

    List<Map<String, dynamic>> playersWithTeams = [];
    if (selectedTeam == "All") {
      for (var team in teamList) {
        for (var player in team.players?.values ?? []) {
          playersWithTeams.add({"teamShort": team.nameShort ?? "UNK", "player": player});
        }
      }
    } else {
      final selectedTeamData = teamList.firstWhere((team) => team.nameFull == selectedTeam);
      for (var player in selectedTeamData.players?.values ?? []) {
        playersWithTeams.add({"teamShort": selectedTeamData.nameShort ?? "UNK", "player": player});
      }
    }

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
                child: _buildDropdown(theme, teamList),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  itemCount: playersWithTeams.length,
                  itemBuilder: (context, index) {
                    final teamShortName = playersWithTeams[index]["teamShort"];
                    final Player player = playersWithTeams[index]["player"];
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

  /// Dropdown Widget
  Widget _buildDropdown(ThemeData theme, List<Team> teamList) {
    return CustomDropDownWidget<String>(
      selectedValue: selectedTeam,
      items: ["All", ...teamList.map((t) => t.nameFull ?? "Unknown")],
      onChanged: (value) => setState(() => selectedTeam = value!),
      itemLabel: (team) => team,
    );
  }

  /// Player Card
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

class PlayerDetailsSheet extends StatelessWidget {
  final Player player;

  const PlayerDetailsSheet({super.key, required this.player});

  String getFormattedPlayerName() {
    String name = player.nameFull ?? "Unknown";
    List<String> highlights = [];
    if (player.iscaptain == true) highlights.add("C");
    if (player.iskeeper == true) highlights.add("WK");
    return highlights.isNotEmpty ? "$name (${highlights.join(" & ")})" : name;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor.withOpacity(0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              player.nameFull ?? "Unknown Player",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
          const SizedBox(height: 12),
          CustomRowWidget(
            title: "Batting Style",
            value: player.batting?.style ?? "Unknown",
            highlight: true,
            icon: Icons.sports_cricket,
          ),
          CustomRowWidget(
            title: "Bowling Style",
            value: player.bowling?.style ?? "Unknown",
            highlight: true,
            icon: Icons.sports_handball,
          ),
          const Divider(),
          CustomRowWidget(title: "Total Runs", value: player.batting?.runs ?? "N/A"),
          CustomRowWidget(title: "Batting Avg", value: player.batting?.average ?? "N/A"),
          CustomRowWidget(title: "Strike Rate", value: player.batting?.strikerate ?? "N/A"),
          CustomRowWidget(title: "Total Wickets", value: player.bowling?.wickets ?? "N/A"),
          CustomRowWidget(title: "Bowling Economy", value: player.bowling?.economyrate ?? "N/A"),
        ],
      ),
    );
  }

  static void show(BuildContext context, Player player) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => PlayerDetailsSheet(player: player),
    );
  }
}
