import 'package:flutter_blue_archive/domain/repositories/character_voice_repository.dart';
import 'package:just_audio/just_audio.dart';

class CharacterVoiceRepositoryImp implements CharacterVoiceRepository {
  @override
  AudioPlayer load(String url) {
    return AudioPlayer()..setUrl(url);
  }

  @override
  void play(AudioPlayer player) async {
    await player.play();
  }
}
