import 'package:flutter/material.dart';
import 'package:si_assessment/models/match_model.dart';
import 'package:si_assessment/widgets/custom_row_widget.dart';

class CustomTeamWidget extends StatelessWidget {
  const CustomTeamWidget({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTeamName(match),
        const SizedBox(height: 10),
        CustomRowWidget(title: "Date", value: match.matchdetail?.match?.date ?? "N/A", icon: Icons.calendar_today, ),
        CustomRowWidget(title: "Venue", value: match.matchdetail?.venue?.name ?? "Unknown", icon: Icons.location_on, )
      ],
    );
  }

  Widget _buildTeamName(MatchModel match) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        "${match.teams?.values.first.nameFull} vs ${match.teams?.values.last.nameFull}",
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Gradient will apply
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}