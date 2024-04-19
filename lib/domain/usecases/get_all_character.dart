import 'package:flutter_blue_archive/domain/entities/character.dart';
import 'package:flutter_blue_archive/domain/repositories/character_repository.dart';

class GetAllCharacter {
  final CharacterRepository _repository;

  GetAllCharacter(this._repository);

  Future<List<Character>> execute() {
    return _repository.getAllCharacter();
  }
}
