import 'package:flutter_blue_archive/domain/repositories/character_voice_repository.dart';
import 'package:just_audio/just_audio.dart';

class PlayCharacterVoice {
  final CharacterVoiceRepository _repository;
  late AudioPlayer _player;

  PlayCharacterVoice.load(this._repository, String url) {
    _player = _repository.load(url);
  }
  void play() {
    _repository.play(_player);
  }
}
