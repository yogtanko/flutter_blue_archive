import 'package:dio/dio.dart';
import 'package:flutter_blue_archive/data/model/character_detail_model.dart';
import 'package:flutter_blue_archive/domain/entities/character_detail.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_detail_char_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_blue_archive/data/src/remote_data_source.dart';

@GenerateMocks([Dio])
void main() {
  test('Get character detail by name', () async {
    Dio dio = MockDio();
    when(dio.get(
            'https://api-blue-archive.vercel.app/api/characters/students?name=Arisu'))
        .thenAnswer((_) async {
      return Future.value(
        Response<dynamic>(
            data: {
              "message": "success",
              "data": [
                {
                  "_id": "634105c407843834fd29f016",
                  "name": "Arisu",
                  "names": {
                    "firstName": "Arisu",
                    "lastName": "Tendou",
                    "japanName": " 天童 アリス",
                    "_id": "634105c407843834fd29f017"
                  },
                  "age": "??",
                  "school": "Millennium",
                  "birthday": "March 25",
                  "background":
                      "Student of Millennium and member of the Game development club. She was found sleeping inside some ruins. Everything about her is unknown, including her age. Currently, she enjoys playing videogames with Momoi, Midori and Yuzu and has become a serious game maniac. Because she picks up lines from retro games, her speech tends to be hesitant and unnatural.",
                  "height": "152cm",
                  "photoUrl":
                      "https://static.miraheze.org/bluearchivewiki/thumb/0/0f/Arisu.png/266px-Arisu.png",
                  "image": "",
                  "imageSpecial": [],
                  "imageSchool":
                      "https://static.miraheze.org/bluearchivewiki/thumb/2/2a/Millennium.png/50px-Millennium.png",
                  "hobbies": ["Games (Especially RPGs)"],
                  "voice": "Minami Tanaka",
                  "voices":
                      "https://static.miraheze.org/bluearchivewiki/2/2c/Arisu_Title.ogg",
                  "role": ["Attacker/Back", "Attacker", "Back"],
                  "damageType": "Mystic",
                  "armorType": "Special",
                  "affinity": [
                    {
                      "urban":
                          "https://static.miraheze.org/bluearchivewiki/thumb/1/13/Icon_location_city.png/24px-Icon_location_city.png",
                      "urbanEmotion":
                          "https://static.miraheze.org/bluearchivewiki/thumb/5/5f/Icon_mood_b.png/20px-Icon_mood_b.png"
                    },
                    {
                      "outdoors":
                          "https://static.miraheze.org/bluearchivewiki/thumb/6/6d/Icon_location_outdoors.png/24px-Icon_location_outdoors.png",
                      "outdoorsEmotion":
                          "https://static.miraheze.org/bluearchivewiki/thumb/8/81/Icon_mood_d.png/20px-Icon_mood_d.png"
                    },
                    {
                      "indoors":
                          "https://static.miraheze.org/bluearchivewiki/thumb/c/c1/Icon_location_indoors.png/24px-Icon_location_indoors.png",
                      "indoorsEmotion":
                          "https://static.miraheze.org/bluearchivewiki/thumb/e/e3/Icon_mood_s.png/20px-Icon_mood_s.png"
                    }
                  ],
                  "weapon": "RG",
                  "weaponUnique": "Sword of Light: Supernova",
                  "weaponImage":
                      "https://static.miraheze.org/bluearchivewiki/3/37/Weapon_Icon_10015.png",
                  "realeaseDate": "2021/03/25"
                }
              ]
            },
            statusCode: 200,
            requestOptions: RequestOptions(
                path:
                    'https://api-blue-archive.vercel.app/api/characters/students?name=Arisu')),
      );
    });
    CharacterDetailModel characterModel =
        await RemoteDataSourceImpl(dio).getCharacterByName('Arisu');
    CharacterDetail character = characterModel.toEntity();
    expect(character, isA<CharacterDetail>());
    expect(character, isNotNull);
    expect(character.name, isA<String>());
    expect(character.name, equals("Arisu"));
    expect(character.firstName, equals("Arisu"));
    expect(character.lastName, equals("Tendou"));
    expect(character.japanName, equals("天童 アリス"));
    expect(character.school, equals("Millennium"));
    expect(character.birthday, equals("March 25"));
    expect(
        character.background,
        equals(
            "Student of Millennium and member of the Game development club. She was found sleeping inside some ruins. Everything about her is unknown, including her age. Currently, she enjoys playing videogames with Momoi, Midori and Yuzu and has become a serious game maniac. Because she picks up lines from retro games, her speech tends to be hesitant and unnatural."));
    expect(character.height, equals("152cm"));
    expect(
        character.photoUrl,
        equals(
            "https://static.miraheze.org/bluearchivewiki/thumb/0/0f/Arisu.png/266px-Arisu.png"));
    expect(character.image, equals(""));
    expect(
        character.imageSchool,
        equals(
            "https://static.miraheze.org/bluearchivewiki/thumb/2/2a/Millennium.png/50px-Millennium.png"));

    expect(character.hobbies, isA<List<String>>());
    expect(character.hobbies, equals(["Games (Especially RPGs)"]));
    expect(character.voice, equals("Minami Tanaka"));
    expect(
        character.voices,
        equals(
            "https://static.miraheze.org/bluearchivewiki/2/2c/Arisu_Title.ogg"));
    expect(character.roles, isA<List<String>>());
    expect(character.roles, equals(["Attacker/Back", "Attacker", "Back"]));
    expect(character.damageType, equals("Mystic"));
    expect(character.armorType, equals("Special"));

    expect(character.affinity, isA<Map<String, String>>());
    expect(
        character.affinity,
        equals({
          "urban":
              "https://static.miraheze.org/bluearchivewiki/thumb/1/13/Icon_location_city.png/24px-Icon_location_city.png",
          "urbanEmotion":
              "https://static.miraheze.org/bluearchivewiki/thumb/5/5f/Icon_mood_b.png/20px-Icon_mood_b.png",
          "outdoors":
              "https://static.miraheze.org/bluearchivewiki/thumb/6/6d/Icon_location_outdoors.png/24px-Icon_location_outdoors.png",
          "outdoorsEmotion":
              "https://static.miraheze.org/bluearchivewiki/thumb/8/81/Icon_mood_d.png/20px-Icon_mood_d.png",
          "indoors":
              "https://static.miraheze.org/bluearchivewiki/thumb/c/c1/Icon_location_indoors.png/24px-Icon_location_indoors.png",
          "indoorsEmotion":
              "https://static.miraheze.org/bluearchivewiki/thumb/e/e3/Icon_mood_s.png/20px-Icon_mood_s.png"
        }));
    expect(character.weapon, equals("RG"));
    expect(character.weaponUnique, equals("Sword of Light: Supernova"));
    expect(
        character.weaponImage,
        equals(
            "https://static.miraheze.org/bluearchivewiki/3/37/Weapon_Icon_10015.png"));
  });
}
