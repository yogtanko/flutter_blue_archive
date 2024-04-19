import 'package:flutter_blue_archive/data/src/remote_data_source.dart';
import 'package:flutter_blue_archive/domain/entities/character.dart';
import 'package:flutter_blue_archive/domain/entities/character_detail.dart';
import 'package:flutter_blue_archive/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final RemoteDataSource _remoteDataSource;

  CharacterRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Character>> getAllCharacter() async {
    try {
      final result = await _remoteDataSource.getAllCharacter();
      final finalResult = result.map((e) => e.toEntity());
      return finalResult.toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CharacterDetail> getCharacterByName(String name) async {
    final result = await _remoteDataSource.getCharacterByName(name);
    return result.toEntity();
  }
}
