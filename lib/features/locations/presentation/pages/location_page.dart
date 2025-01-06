import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_rickandmorty/core/design/tokens/colors.dart';
import 'package:seek_rickandmorty/features/locations/domain/bloc/location_bloc/location_bloc.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_entity.dart';
import 'package:seek_rickandmorty/features/locations/presentation/widgets/location_cover_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String selectedDimension = 'All';

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(const FetchLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        mini: false,
        backgroundColor: MainColors.colorsCustom.toxicPurple.color,
        onPressed: () {
          context.read<LocationBloc>().add(const FetchLocation());
        },
        child: const Icon(
          Icons.queue_play_next_outlined,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (e) {
              return Center(
                child: Text(e),
              );
            },
            loadedSearch: (locations) {
              return buildCoverList(locations: locations, context: context);
            },
            loaded: (locations, nextPage) {
              return buildCoverList(locations: locations, context: context);
            },
          );
        },
      ),
    );
  }

  Widget buildCoverList(
      {required Map<String, List<LocationEntity>> locations,
      required BuildContext context}) {
    return ListView.builder(
      reverse: false,
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final dimension = locations.keys.elementAt(index);
        final locationsInDimension = locations[dimension]!;
        return _buildSectionHeader(
          dimension: dimension,
          locationsInDimension: locationsInDimension,
        );
      },
    );
  }

  Widget _buildSectionHeader({
    required String dimension,
    required List<LocationEntity> locationsInDimension,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Text(
            'Dimension $dimension',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150, // Altura de la lista horizontal
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: locationsInDimension.length,
            // Número de elementos en la lista
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: LocationCover(
                  location: locationsInDimension[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
