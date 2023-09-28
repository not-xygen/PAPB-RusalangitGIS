import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'login_screen.dart';

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
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

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
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.13,
            maxChildSize: 0.9,
            snap: true,
            snapSizes: const [0.13, 0.3, 0.9],
            builder: (BuildContext context, myScrollController) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: ListView(
                    controller: myScrollController,
                    children: [
                      // Wrap the first and second children in a Column
                      Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -6.0),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: ((width / 2) - 20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.0),
                                child: Container(
                                  height: 4.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80.0,
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey.shade50,
                                          hintText: 'Search...',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Rest of your children in the ListView
                      Container(
                        height: 1000.0,
                        width: width,
                        color: Colors.red,
                        child: const Text("Recents"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
