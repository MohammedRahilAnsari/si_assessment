import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:si_assessment/widgets/custom_row_widget.dart';
import 'package:si_assessment/models/match_model.dart';

class PlayerDetailsSheet extends StatefulWidget {
  final Player player;

  const PlayerDetailsSheet({super.key, required this.player});

  @override
  State<PlayerDetailsSheet> createState() => _PlayerDetailsSheetState();

  static void show(BuildContext context, Player player) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {}, // Prevents accidental closing when tapping inside
            child: PlayerDetailsSheet(player: player),
          ),
        ),
      ),
    );
  }
}

class _PlayerDetailsSheetState extends State<PlayerDetailsSheet> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final player = widget.player;

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      builder: (context, scrollController) {
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
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 12),

              // Tab bar for Batting & Bowling
              TabBar(
                controller: _tabController,
                indicatorColor: theme.colorScheme.primary,
                labelColor: theme.textTheme.bodyLarge?.color,
                unselectedLabelColor: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                tabs: const [
                  Tab(text: "Batting"),
                  Tab(text: "Bowling"),
                ],
              ),
              const SizedBox(height: 10),

              // Scrollable Tab View
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(child: _buildBattingTab(player)),
                    SingleChildScrollView(child: _buildBowlingTab(player)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Creates a pie chart with percentage-based values
  Widget _buildPieChart(List<ChartData> data) {
    final theme = Theme.of(context);
    bool hasData = data.any((chartData) => chartData.value > 0);

    return hasData
        ? SfCircularChart(
      title: ChartTitle(
        text: "Player Stats (Normalized)",
        textStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      legend: const Legend(isVisible: true, position: LegendPosition.bottom),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.label,
          yValueMapper: (ChartData data, _) => data.value,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          explode: true,
          explodeIndex: 0,
        ),
      ],
    )
        : Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          "No stats available",
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  // Converts raw numerical data to percentage-based chart values
  ChartData _chartData(String label, String? value, double maxValue) {
    double parsedValue = double.tryParse(value ?? "0") ?? 0.0;
    double percentage = (parsedValue / maxValue) * 100;
    return ChartData(label, percentage);
  }

  // Builds the Batting tab with player stats & pie chart
  Widget _buildBattingTab(Player player) {
    return Column(
      children: [
        CustomRowWidget(title: "Batting Style", value: player.batting?.style ?? "Unknown", highlight: true, icon: Icons.sports_cricket),
        CustomRowWidget(title: "Total Runs", value: player.batting?.runs ?? "N/A"),
        CustomRowWidget(title: "Batting Avg", value: player.batting?.average ?? "N/A"),
        CustomRowWidget(title: "Strike Rate", value: player.batting?.strikerate ?? "N/A"),
        const SizedBox(height: 12),

        _buildPieChart([
          _chartData("Runs", player.batting?.runs, 10000),
          _chartData("Avg", player.batting?.average, 100),
          _chartData("Strike Rate", player.batting?.strikerate, 250),
        ]),
      ],
    );
  }

  // Builds the Bowling tab with player stats & pie chart
  Widget _buildBowlingTab(Player player) {
    return Column(
      children: [
        CustomRowWidget(title: "Bowling Style", value: player.bowling?.style ?? "Unknown", highlight: true, icon: Icons.sports_handball),
        CustomRowWidget(title: "Total Wickets", value: player.bowling?.wickets ?? "N/A"),
        CustomRowWidget(title: "Bowling Economy", value: player.bowling?.economyrate ?? "N/A"),
        CustomRowWidget(title: "Bowling Average", value: player.bowling?.average ?? "N/A"),
        const SizedBox(height: 12),

        _buildPieChart([
          _chartData("Wickets", player.bowling?.wickets, 800),
          _chartData("Economy", player.bowling?.economyrate, 12),
          _chartData("Average", player.bowling?.average, 100),
        ]),
      ],
    );
  }
}

// Data model for the pie chart
class ChartData {
  final String label;
  final double value;

  ChartData(this.label, this.value);
}