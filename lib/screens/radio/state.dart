import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hermitage/screens/services/audio.dart';

part 'state.g.dart';

final radioStateProvider = StateNotifierProvider<RadioStateNotifier, RadioState>((ref) {
  return RadioStateNotifier(
    RadioState(playing: false),
  );
});

@CopyWith()
class RadioState {
  bool playing;

  RadioState({
    required this.playing,
  });
}

class RadioStateNotifier extends StateNotifier<RadioState> {
  RadioStateNotifier(RadioState state) : super(state);

  final service = AudioService();

  void toggle() async {
    if (state.playing) {
      service.stop();
      state = state.copyWith(playing: false);
    } else {
      final playing = await service.play();
      state = state.copyWith(playing: playing);
    }

  }
}
