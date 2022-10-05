import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/domain/services/audio_service.dart';
import 'package:speakyfox/presentation/common/resources/sound_assets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AudioService audioService = AudioService();

  testWidgets('playSounds', (tester) async {
    //This seems to work only on platforms and cannot be successfully called in tests on the development device (macOS, PC)
    // await audioService.play(SoundAssets.success);
  });
}
