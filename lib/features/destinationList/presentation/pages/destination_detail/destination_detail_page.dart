import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/destination.dart';
import '../../bloc/destination/local/local_destination_bloc.dart';
import '../../bloc/destination/local/local_destination_event.dart';

class DestinationDetailsPage extends HookWidget {
  final DestinationEntity? destination;

  const DestinationDetailsPage({Key? key, this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalDestinationBloc>(),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: const Icon(Ionicons.chevron_back, color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      destination!.destinationName!,
                      style: const TextStyle(
                          fontFamily: 'Butler',
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),

                    const SizedBox(height: 14),
                    // DateTime
                    Row(
                      children: [
                        const Icon(Ionicons.time_outline, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          destination!.location!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 250,
                margin: const EdgeInsets.only(top: 14),
                child: Image.network(destination!.image!, fit: BoxFit.cover),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                child: Text(
                  '${destination!.description ?? ''}\n\n${destination!.address ?? ''}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _onFloatingActionButtonPressed(context),
            child: const Icon(Ionicons.bookmark, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalDestinationBloc>(context)
        .add(SaveDestination(destination!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Destination saved successfully.'),
      ),
    );
  }
}
