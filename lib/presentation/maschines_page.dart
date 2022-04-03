import 'package:flutter/material.dart';

class MaschinesPage extends StatelessWidget {
  const MaschinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: AppBar(
        title: const Text(
          "Maschinen",
        ),
      ),
    );
  }
}
