import 'package:flutter/material.dart';
import 'dart:math';

class PersonTile extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const PersonTile({
    super.key,
    required this.name,
    this.imageUrl,
  });

  Color? get _getBackgroundColor {
    final shouldGenerateColor = imageUrl == null || imageUrl!.isEmpty;
    if (!shouldGenerateColor) return null;

    final Random random = Random();
    return Color.fromARGB(
      200,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: _getBackgroundColor,
          backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
              ? NetworkImage(imageUrl!)
              : null,
          child: imageUrl == null || imageUrl!.isEmpty
              ? Text(
                  name[0].toUpperCase(),
                  textAlign: TextAlign.center,
                )
              : null,
        ),
        const SizedBox(width: 8),
        Text(name, style: theme.textTheme.titleMedium),
      ],
    );
  }
}
