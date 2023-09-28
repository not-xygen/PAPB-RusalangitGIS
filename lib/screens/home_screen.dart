import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:rusalangit_gis/widgets/bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final accessToken =
      'pk.eyJ1Ijoibm90LXh5Z2VuIiwiYSI6ImNsbXozY2dmZzA1bnYydW12MTBvcGhsdzUifQ.Hg1pUI4tkuLSEh1xNjEuvA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          MapboxMap(
            accessToken: accessToken,
            styleString: MapboxStyles.MAPBOX_STREETS,
            initialCameraPosition: const CameraPosition(
              target: LatLng(-1.2406022721612544, 116.8597071497806),
              zoom: 12,
            ),
          ),
          const DraggableBottomSheet()
        ],
      )),
    );
  }
}
