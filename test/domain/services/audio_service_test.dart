import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/domain/services/audio_service.dart';
import 'package:speakyfox/presentation/common/resources/sound_assets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AudioService audioService = AudioService();

  testWidgets('playSounds', (tester) async {
     audioService.play(SoundAssets.success);
  });
}
