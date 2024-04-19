import 'package:flutter/material.dart';
import 'package:flutter_blue_archive/presentation/providers/character_provider.dart';
import 'package:flutter_blue_archive/presentation/widgets/character_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue[200],
        title: const Text("Blue Archive Database"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: ref.watch(getCharacterProvider).execute(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 180,
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 150 / 180),
                    itemCount: data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CharacterListTile(
                        photoUrl: data![index].photoUrl,
                        name: data[index].name,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: Text('Loading...'),
          );
        },
      ),
    );
  }
}
