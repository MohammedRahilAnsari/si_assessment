
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/match_model.dart';
import '../repositories/match_repository.dart';

class MatchViewModel extends StateNotifier<AsyncValue<MatchModel>> {
  final MatchRepository _repository;
  final String matchId;

  MatchViewModel(this._repository, this.matchId) : super(const AsyncValue.loading()) {
    fetchMatchDetails();
  }

  Future<void> fetchMatchDetails() async {
    try {
      final match = await _repository.fetchMatchDetails(matchId);
      state = AsyncValue.data(match);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}