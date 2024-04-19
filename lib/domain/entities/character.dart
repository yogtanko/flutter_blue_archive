import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String _name;
  final String _school;
  final String _birthday;
  final String _photoUrl;
  final String _image;
  final String _imageSchool;
  final String _damageType;

  const Character(
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
