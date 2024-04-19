import 'package:equatable/equatable.dart';
import 'package:flutter_blue_archive/domain/entities/character_detail.dart';

class CharacterDetailModel extends Equatable {
  final String _name;
  final String _firstName;
  final String _lastName;
  final String _japanName;
  final String _background;
  final String _height;
  final String _school;
  final String _birthday;
  final String _photoUrl;
  final String _image;
  final String _imageSchool;
  final List<String> _hobbies;
  final String _voice;
  final String _voices;
  final List<String> _roles;
  final String _damageType;
  final String _armorType;
  final Map<String, String> _affinity;
  final String _weapon;
  final String _weaponUnique;
  final String _weaponImage;

  const CharacterDetailModel(
      {required String name,
      required String firstName,
      required String lastName,
      required String japanName,
      required String background,
      required String height,
      required String school,
      required String birthday,
      required String photoUrl,
      required String image,
      required String imageSchool,
      required List<String> hobbies,
      required String voice,
      required String voices,
      required List<String> roles,
      required String damageType,
      required String armorType,
      required Map<String, String> affinity,
      required String weapon,
      required String weaponUnique,
      required String weaponImage})
      : _name = name,
        _firstName = firstName,
        _lastName = lastName,
        _japanName = japanName,
        _background = background,
        _height = height,
        _school = school,
        _birthday = birthday,
        _photoUrl = photoUrl,
        _image = image,
        _imageSchool = imageSchool,
        _hobbies = hobbies,
        _voice = voice,
        _voices = voices,
        _roles = roles,
        _damageType = damageType,
        _armorType = armorType,
        _affinity = affinity,
        _weapon = weapon,
        _weaponUnique = weaponUnique,
        _weaponImage = weaponImage;

  String get name => _name;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get japanName => _japanName;
  String get background => _background;
  String get height => _height;
  String get school => _school;
  String get birthday => _birthday;
  String get photoUrl => _photoUrl;
  String get image => _image;
  String get imageSchool => _imageSchool;
  List<String> get hobbies => _hobbies;
  List<String> get roles => _roles;
  String get voice => _voice;
  String get voices => _voices;
  String get damageType => _damageType;
  String get armorType => _armorType;
  Map<String, String> get affinity => _affinity;
  String get weapon => _weapon;
  String get weaponUnique => _weaponUnique;
  String get weaponImage => _weaponImage;

  factory CharacterDetailModel.fromJson(dynamic data) {
    var dAffinity = data['affinity'] ??
        [
          {'noData': 'no data'}
        ];
    Map<String, String> fAffinity = {};
    for (var d in dAffinity) {
      for (var entry in d.entries) {
        Map<String, String> f = {entry.key: entry.value.toString()};
        fAffinity.addEntries(f.entries);
      }
    }

    return CharacterDetailModel(
      name: data['name'] ?? "no data",
      firstName: (data['names']?['firstName'] ?? "no data").trim(),
      lastName: (data['names']?['lastName'] ?? "no data").trim(),
      japanName: (data['names']?['japanName'] ?? "no data").trim(),
      background: data['background'] ?? "no data",
      height: data['height'] ?? "no data",
      school: data['school'] ?? "no data",
      birthday: data['birthday'] ?? "no data",
      photoUrl: data['photoUrl'] ?? "no data",
      image: data['image'] ?? "no data",
      imageSchool: data['imageSchool'] ?? "no data",
      hobbies: (data['hobbies'] as List).map((item) => item as String).toList(),
      voice: data['voice'] ?? "no data",
      voices: data['voices'] ?? "no data",
      roles: (data['role'] as List).map((item) => item as String).toList(),
      damageType: data['damageType'] ?? "no data",
      armorType: data['armorType'] ?? "no data",
      affinity: fAffinity,
      weapon: data['weapon'] ?? "no data",
      weaponUnique: data['weaponUnique'] ?? "no data",
      weaponImage: data['weaponImage'] ?? "no data",
    );
  }
  factory CharacterDetailModel.empty() {
    return const CharacterDetailModel(
      name: "no data",
      firstName: "no data",
      lastName: "no data",
      japanName: "no data",
      background: "no data",
      height: "no data",
      school: "no data",
      birthday: "no data",
      photoUrl: "no data",
      image: "no data",
      imageSchool: "no data",
      hobbies: ["no data"],
      voice: "no data",
      voices: "no data",
      roles: ["no data"],
      damageType: "no data",
      armorType: "no data",
      affinity: {'noData': 'no data'},
      weapon: "no data",
      weaponUnique: "no data",
      weaponImage: "no data",
    );
  }

  CharacterDetail toEntity() {
    return CharacterDetail(
        name: name,
        firstName: firstName,
        lastName: lastName,
        japanName: japanName,
        background: background,
        height: height,
        school: school,
        birthday: birthday,
        photoUrl: photoUrl,
        image: image,
        imageSchool: imageSchool,
        hobbies: hobbies,
        voice: voice,
        voices: voices,
        roles: roles,
        damageType: damageType,
        armorType: armorType,
        affinity: affinity,
        weapon: weapon,
        weaponUnique: weaponUnique,
        weaponImage: weaponImage);
  }

  @override
  List<Object?> get props => [
        name,
        firstName,
        lastName,
        japanName,
        background,
        height,
        school,
        birthday,
        photoUrl,
        image,
        imageSchool,
        hobbies,
        voice,
        voices,
        roles,
        damageType,
        armorType,
        // affinity,
        weapon,
        weaponUnique,
        weaponImage,
      ];
}
