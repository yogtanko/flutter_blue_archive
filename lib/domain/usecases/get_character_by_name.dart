import 'package:flutter_blue_archive/domain/entities/character_detail.dart';
import 'package:flutter_blue_archive/domain/repositories/character_repository.dart';

class GetCharacterByName {
  final CharacterRepository _repository;

  GetCharacterByName(this._repository);

  Future<CharacterDetail> execute(String name) {
    return _repository.getCharacterByName(name);
  }
}
