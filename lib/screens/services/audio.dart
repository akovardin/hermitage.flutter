import 'package:audioplayers/audioplayers.dart';

class AudioService {
  AudioPlayer player = AudioPlayer();
  String url = 'https://hermitage.hostingradio.ru/hermitage128.mp3';

  Future<bool> play() async {
    int result = await player.play(url);
    return result == 1;
  }

  Future<bool> stop() async {
    int result = await player.stop();
    return result == 1;
  }
}
