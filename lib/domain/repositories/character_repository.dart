import 'package:flutter_blue_archive/domain/entities/character.dart';
import 'package:flutter_blue_archive/domain/entities/character_detail.dart';

abstract class CharacterRepository {
  Future<List<Character>> getAllCharacter();
  Future<CharacterDetail> getCharacterByName(String name);
}
