import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:si_assessment/core/api_client.dart';
import '../core/constants.dart';

final httpClientProvider = Provider(
      (ref) => AppHttpClient(AppConstants.baseUrl, http.Client()),
);