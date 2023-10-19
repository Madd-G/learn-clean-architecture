import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/destination.dart';
import '../../bloc/destination/local/local_destination_bloc.dart';
import '../../bloc/destination/local/local_destination_event.dart';
import '../../bloc/destination/local/local_destination_state.dart';
import '../../widgets/destination_tile.dart';

class SavedDestination extends HookWidget {
  const SavedDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<LocalDestinationBloc>()..add(const GetSavedDestination()),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _onBackButtonTapped(context),
              child: const Icon(Ionicons.chevron_back, color: Colors.black),
            ),
          ),
          title: const Text('Saved Destinations',
              style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<LocalDestinationBloc, LocalDestinationState>(
          builder: (context, state) {
            if (state is LocalDestinationLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is LocalDestinationDone) {
              if (state.destinations!.isEmpty) {
                return const Center(
                    child: Text(
                  'NO SAVED DESTINATION',
                  style: TextStyle(color: Colors.black),
                ));
              }

              return ListView.builder(
                itemCount: state.destinations?.length,
                itemBuilder: (context, index) {
                  return DestinationWidget(
                    destination: state.destinations?[index],
                    isRemovable: true,
                    onRemove: (destination) =>
                        _onRemoveDestination(context, destination),
                    onDestinationPressed: (destination) =>
                        _onDestinationPressed(context, destination),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveDestination(
      BuildContext context, DestinationEntity destinationEntity) {
    BlocProvider.of<LocalDestinationBloc>(context)
        .add(RemoveDestination(destinationEntity));
  }

  void _onDestinationPressed(
      BuildContext context, DestinationEntity destinationEntity) {
    Navigator.pushNamed(context, '/DestinationDetails',
        arguments: destinationEntity);
  }
}
