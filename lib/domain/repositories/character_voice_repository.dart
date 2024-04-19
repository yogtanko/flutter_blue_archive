import 'package:just_audio/just_audio.dart';

abstract class CharacterVoiceRepository {
  AudioPlayer load(String url);
  void play(AudioPlayer player);
}
