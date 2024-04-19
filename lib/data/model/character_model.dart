import 'package:equatable/equatable.dart';
import 'package:flutter_blue_archive/domain/entities/character.dart';

class CharacterModel extends Equatable {
  final String _name;
  final String _school;
  final String _birthday;
  final String _photoUrl;
  final String _image;
  final String _imageSchool;
  final String _damageType;

  const CharacterModel(
      {required String name,
      required String school,
      required String birthday,
      required String photoUrl,
      required String image,
      required String imageSchool,
      required String damageType})
      : _name = name,
        _school = school,
        _birthday = birthday,
        _photoUrl = photoUrl,
        _image = image,
        _imageSchool = imageSchool,
        _damageType = damageType;

  String get name => _name;
  String get school => _school;
  String get birthday => _birthday;
  String get photoUrl => _photoUrl;
  String get image => _image;
  String get imageSchool => _imageSchool;
  String get damageType => _damageType;

  factory CharacterModel.fromJson(dynamic data) {
    return CharacterModel(
      name: data['name'] ?? "no data",
      school: data['school'] ?? "no data",
      birthday: data['birthday'] ?? "no data",
      photoUrl: data['photoUrl'] ?? "no data",
      image: data['image'] ?? "no data",
      imageSchool: data['imageSchool'] ?? "no data",
      damageType: data['damageType'] ?? "no data",
    );
  }
  factory CharacterModel.empty() {
    return const CharacterModel(
      name: "no data",
      school: "no data",
      birthday: "no data",
      photoUrl: "no data",
      image: "no data",
      imageSchool: "no data",
      damageType: "no data",
    );
  }

  Character toEntity() {
    return Character(
      name: name,
      school: school,
      birthday: birthday,
      photoUrl: photoUrl,
      image: image,
      imageSchool: imageSchool,
      damageType: damageType,
    );
  }

  @override
  List<Object?> get props => [
        name,
        school,
        birthday,
        photoUrl,
        image,
        imageSchool,
        damageType,
      ];
}
