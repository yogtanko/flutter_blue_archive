import 'package:dio/dio.dart';
import 'package:flutter_blue_archive/data/model/character_detail_model.dart';
import 'package:flutter_blue_archive/data/model/character_model.dart';

abstract class RemoteDataSource {
  Future<List<CharacterModel>> getAllCharacter();
  Future<CharacterDetailModel> getCharacterByName(String name);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;
  const RemoteDataSourceImpl(this.dio);
  @override
  Future<List<CharacterModel>> getAllCharacter() async {
    try {
      double totalData = 0;
      List<CharacterModel>? data = [];
      final response = await dio.get(
          "https://api-blue-archive.vercel.app/api/characters?page=1&perPage=1");
      if (response.statusCode == 200) {
        totalData =
            double.tryParse(response.data['dataAllPage'].toString()) ?? 0;
      }
      for (int i = 0; i < (totalData / 20).ceil(); i++) {
        final response = await dio.get(
            "https://api-blue-archive.vercel.app/api/characters?page=${i + 1}&perPage=20");
        for (var r in response.data['data']) {
          data.add(CharacterModel.fromJson(r));
        }
      }
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CharacterDetailModel> getCharacterByName(String name) async {
    final response = await dio.get(
        "https://api-blue-archive.vercel.app/api/characters/students?name=$name");
    if (response.statusCode == 200) {
      return CharacterDetailModel.fromJson(response.data['data'][0]);
    }
    return CharacterDetailModel.empty();
  }
}
