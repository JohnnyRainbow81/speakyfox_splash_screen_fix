import 'package:speakyfox/domain/repositories/progress_repository.dart';

class ProgressService {
  final ProgressRepository _progressRepository;

  ProgressService(this._progressRepository);

  Future<bool> updateProgress(String lectureId, double progress) async{
    return _progressRepository.updateProgress(lectureId, progress);
  }
}
