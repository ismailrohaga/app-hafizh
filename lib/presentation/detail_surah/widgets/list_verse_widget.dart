import 'package:flutter/material.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/entity/detail_surah_entity.dart';

class ListVerseWidget extends StatelessWidget {
  const ListVerseWidget({
    super.key,
    required this.verses,
    required this.status,
    required this.textTheme,
    required this.colors,
  });

  final List<VerseEntity>? verses;
  final ViewState status;
  final TextTheme textTheme;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build as design in figma @mizard
    return ListView.builder(
        itemCount: verses?.length ?? 0,
        itemBuilder: (context, index) {
          if (status.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final verse = verses![index];

          return Card(
            child: ListTile(
              title: Text("Ayat ${verse.number.inSurah}",
                  style: textTheme.titleLarge?.copyWith(color: colors.primary)),
              subtitle: Text(
                verse.text.arab,
                style: textTheme.titleMedium?.copyWith(color: colors.secondary),
              ),
            ),
          );
        });
  }
}
