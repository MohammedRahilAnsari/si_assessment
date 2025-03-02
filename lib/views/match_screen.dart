import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:si_assessment/core/constants.dart';
import 'package:si_assessment/views/squad_screen.dart';
import 'package:si_assessment/widgets/custom_app_bar.dart';
import 'package:si_assessment/widgets/custom_background.dart';
import 'package:si_assessment/widgets/custom_team_widget.dart';

import '../core/app_theme.dart';
import '../models/match_model.dart';
import '../providers/match_provider.dart';
import '../providers/theme_provider.dart';

class MatchScreen extends ConsumerWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppThemes.of(context);
    final themeMode = ref.watch(themeProvider);
    final firstMatchState = ref.watch(matchViewModelProvider(AppConstants.firstMatchId));
    final secondMatchState = ref.watch(matchViewModelProvider(AppConstants.secondMatchId));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: AppConstants.appTitle,
        showBackButton: false,
        actions: [
          IconButton(
            icon: Icon(themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode, color: themeMode == ThemeMode.dark ? Colors.white : Colors.yellow,),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: CustomBackground(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildMatchSection("🏏 First Match", firstMatchState, context, theme),
                  const SizedBox(height: 24),
                  _buildMatchSection("🏏 Second Match", secondMatchState, context, theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchSection(String title, AsyncValue<MatchModel> matchState, BuildContext context, ThemeData theme) {
    return matchState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text(
          "Error: $error",
          style: TextStyle(color: theme.colorScheme.error.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      data: (match) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SquadScreen(match: match)),
          );
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: theme.cardColor.withOpacity(0.2), // Glass Effect
            border: Border.all(color: theme.dividerColor.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.2),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              CustomTeamWidget(match: match),
            ],
          ),
        ),
      ),
    );
  }
}
