import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/match_model.dart';
import '../viewmodels/squad_viewmodel.dart';

/// Squad State Provider
final squadProvider = StateNotifierProvider.family<SquadNotifier, List<Map<String, dynamic>>, MatchModel>(
      (ref, match) => SquadNotifier(match),
);