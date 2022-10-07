import 'package:speakyfox/app/connectivity_service.dart';
import 'package:speakyfox/app/error_handling/error_handler.dart';
import 'package:speakyfox/app/error_handling/exceptions_ui.dart';
import 'package:speakyfox/data/remote/progress_client.dart';
import 'package:speakyfox/domain/repositories/progress_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ConnectivityService _connectivityService;
  final ProgressClient _progressClient;

  ProgressRepositoryImpl(this._connectivityService, this._progressClient);

  @override
  Future<bool> updateProgress(String lectureId, double progress) async {
    if (await _connectivityService.hasConnection()) {
      try {
        final response = await _progressClient.updateProgress(lectureId, progress);
        return response.data.toSubscription();
      } catch (error) {
        ErrorHandler.handleError(error);
      }
    } else {
      throw NoInternetConnectionUIException();
    }

    throw UIException(message: "ProgressRepositoryImpl.updateProgress()");
  }
}
