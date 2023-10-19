import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/destination.dart';
import '../../bloc/destination/remote/remote_destination_bloc.dart';
import '../../bloc/destination/remote/remote_destination_state.dart';
import '../../widgets/destination_tile.dart';

class DestinationListPage extends StatelessWidget {
  const DestinationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Popular Destinations In Indonesia',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteDestinationBloc, RemoteDestinationState>(
        builder: (_, state) {
          if (state is RemoteDestinationLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteDestinationError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteDestinationDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return DestinationWidget(
                  destination: state.destinations![index],
                  onDestinationPressed: (destination) =>
                      _onDestinationPressed(context, destination),
                );
              },
              itemCount: state.destinations!.length,
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onShowSavedDestinationViewTapped(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.bookmark),
        ),
      ),
    );
  }

  void _onDestinationPressed(
      BuildContext context, DestinationEntity destination) {
    Navigator.pushNamed(context, '/DestinationDetails', arguments: destination);
  }

  void _onShowSavedDestinationViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedDestination');
  }
}
