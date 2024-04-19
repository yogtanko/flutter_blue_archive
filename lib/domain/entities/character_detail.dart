import 'package:equatable/equatable.dart';

class CharacterDetail extends Equatable {
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

  const CharacterDetail(
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
        affinity,
        weapon,
        weaponUnique,
        weaponImage,
      ];
}
