import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: AppBar(
        title: const Text(
          "Kaffeezähler",
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: theme.colorScheme.primary,
          child: const Center(
            child: Text(
              "Data",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
