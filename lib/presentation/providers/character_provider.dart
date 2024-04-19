import 'package:dio/dio.dart';
import 'package:flutter_blue_archive/data/repositories/character_repository_impl.dart';
import 'package:flutter_blue_archive/data/repositories/character_voice_repository_impl.dart';
import 'package:flutter_blue_archive/data/src/remote_data_source.dart';
import 'package:flutter_blue_archive/domain/entities/character_detail.dart';
import 'package:flutter_blue_archive/domain/usecases/get_all_character.dart';
import 'package:flutter_blue_archive/domain/usecases/get_character_by_name.dart';
import 'package:flutter_blue_archive/domain/usecases/play_character_voice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterRepositoryProvider =
    Provider((ref) => CharacterRepositoryImpl(RemoteDataSourceImpl(Dio())));

final getCharacterProvider =
    Provider((ref) => GetAllCharacter(ref.watch(characterRepositoryProvider)));

final getDetailCharacterProvider =
    FutureProvider.family<CharacterDetail, String>(
  (ref, name) async =>
      await GetCharacterByName(ref.watch(characterRepositoryProvider))
          .execute(name),
);

final characterVoiceRepositoryProvider =
    Provider((ref) => CharacterVoiceRepositoryImp());

final playCharacterVoiceProvider = Provider.family<PlayCharacterVoice, String>(
    (ref, url) => PlayCharacterVoice.load(
        ref.watch(characterVoiceRepositoryProvider), url));
