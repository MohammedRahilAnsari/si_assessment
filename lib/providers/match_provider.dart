import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/match_model.dart';
import '../repositories/match_repository.dart';
import '../viewmodels/match_viewmodel.dart';
import 'http_client_provider.dart';

final matchRepositoryProvider = Provider(
      (ref) => MatchRepository(ref.read(httpClientProvider)),
);

final matchViewModelProvider = StateNotifierProvider.family<MatchViewModel, AsyncValue<MatchModel>, String>(
      (ref, matchId) {
    return MatchViewModel(ref.read(matchRepositoryProvider), matchId);
  },
);