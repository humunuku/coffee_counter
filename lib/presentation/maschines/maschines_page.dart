import 'package:coffee_counter/application/maschines/maschine_bloc.dart';
import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaschinesPage extends StatelessWidget {
  const MaschinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maschineBloc = BlocProvider.of<MaschineBloc>(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: AppBar(
        title: const Text(
          "Maschinen",
        ),
        actions: [
          IconButton(
            onPressed: () {
              maschineBloc.add(AddMaschineEvent());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<MaschineBloc, MaschineState>(
        bloc: maschineBloc..add(MaschinesRequestedEvent()),
        builder: (context, state) {
          if (state is MaschineInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Initial Maschine State!"),
                  TextButton(
                      onPressed: () {
                        maschineBloc.add(MaschinesRequestedEvent());
                      },
                      child: Text("Get Maschines!"))
                ],
              ),
            );
          } else if (state is MaschinesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReloadMaschines) {
            maschineBloc.add(MaschinesRequestedEvent());
          } else if (state is MaschinesLoaded) {
            List<MaschineEntity> maschines = state.maschines;
            if (maschines.isEmpty) {
              return const Center(
                child: Text("Keine Maschinen hinzugefügt."),
              );
            }
            return ListView.builder(
              itemCount: maschines.length,
              itemBuilder: (context, index) {
                MaschineEntity maschine = maschines[index];
                return ListTile(
                  title: Text(maschine.title),
                );
              },
            );
          } else if (state is MaschinesError) {
            return Center(
              child: Text("ERROR STATE: ${state.errorMessage}"),
            );
          }

          return const Center(
            child: Text("DEFAULT STATE"),
          );
        },
      ),
    );
  }
}
