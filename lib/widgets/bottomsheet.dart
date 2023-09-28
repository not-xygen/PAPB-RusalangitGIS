import 'package:flutter/material.dart';
import 'package:rusalangit_gis/screens/login_screen.dart';

class Place {
  final String name;

  Place(this.name);
}

List<Place> recentPlaces = [
  Place('Eiffel Tower'),
  Place('Statue of Liberty'),
  Place('Machu Picchu'),
  Place('Taj Mahal'),
];

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.13,
      maxChildSize: 0.9,
      snap: true,
      snapSizes: const [0.13, 0.3, 0.9],
      builder: (BuildContext context, myScrollController) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: ListView(
              controller: myScrollController,
              children: [
                Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -6.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: ((width / 2) - 20)),
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
                Container(
                  width: width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Terakhir Dilihat",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height:
                                  100.0, // Set the height of the horizontal list
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: recentPlaces.length,
                                itemBuilder: (context, index) {
                                  final place = recentPlaces[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Colors.blue,
                                        ),
                                        const SizedBox(height: 8.0),
                                        SizedBox(
                                          width: 100, // Set your desired width
                                          child: Text(
                                            place.name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis, // Add ellipsis when overflowing
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle button 1 press
                              },
                              child: const Text('Button 1'),
                            ),
                            const SizedBox(
                                width: 16.0), // Add spacing between buttons
                            ElevatedButton(
                              onPressed: () {
                                // Handle button 2 press
                              },
                              child: const Text('Button 2'),
                            ),
                            const SizedBox(
                                width: 16.0), // Add spacing between buttons
                            ElevatedButton(
                              onPressed: () {
                                // Handle button 3 press
                              },
                              child: const Text('Button 3'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
