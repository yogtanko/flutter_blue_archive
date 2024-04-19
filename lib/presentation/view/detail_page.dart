import 'package:flutter/material.dart';
import 'package:flutter_blue_archive/domain/entities/character_detail.dart';
import 'package:flutter_blue_archive/presentation/providers/character_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class DetailPage extends ConsumerWidget {
  final String name;
  const DetailPage({super.key, required this.name});

  _myRow(key, value) {
    return TableRow(
      children: [
        Text(
          key,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(value),
      ],
    );
  }

  _detailWidget(CharacterDetail data, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //first section
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.lightBlue[100]),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(data.photoUrl),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${data.firstName} ${data.lastName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () => ref
                          .watch(playCharacterVoiceProvider(data.voices))
                          .play(),
                      child: const Icon(
                        Icons.volume_up,
                        color: Colors.lightBlue,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Text(
                  data.japanName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.background,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              // Birthday
              const SizedBox(height: 10),
              const Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Table(
                  columnWidths: const {0: FixedColumnWidth(100)},
                  children: [
                    _myRow("Birthday", data.birthday),
                    _myRow("Height", data.height),
                    _myRow("Hobby", data.hobbies.join(", ")),
                    _myRow("School", data.school),
                    _myRow("Weapon", data.weaponUnique),
                    _myRow("Weapon Type", data.weapon),
                    _myRow("CV", data.voice)
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        //second section
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.lightBlue[100]),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Weapon",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text(data.weaponUnique),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.weaponImage),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue[200],
        centerTitle: true,
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ref.watch(getDetailCharacterProvider(name)).when(
                data: (data) => _detailWidget(data, ref),
                error: (error, stackTrace) =>
                    const Text('Error while getting data'),
                loading: () => const Center(child: Text('Loading...')),
              ),
        ),
      ),
    );
  }
}
