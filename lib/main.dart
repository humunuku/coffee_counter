import 'package:coffee_counter/application/maschines/maschine_bloc.dart';
import 'package:coffee_counter/root_widget.dart';
import 'package:coffee_counter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di; // di == dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MaschineBloc>(),
      child: MaterialApp(
        title: 'Kaffeezähler',
        theme: AppTheme.darkTheme,
        initialRoute: "/",
        routes: {
          "/": (context) => const RootWidget(),
        },
      ),
    );
  }
}
