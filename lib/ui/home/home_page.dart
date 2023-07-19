

import 'package:flutter/material.dart';
import 'package:valorant_api_example/services/models/valorant_model.dart';
import 'package:valorant_api_example/services/network/api.dart';
import 'package:valorant_api_example/ui/home/widgets/state_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Apiprovider().fetchValorantData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            ValorantModel valorantModel = snapshot.data!;
            List<Datum> datum = valorantModel.data;

            return Column(
              children: [
                StateeWidget(),

                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemCount: datum.length,
                    itemBuilder: (BuildContext context, int index) {
                      Datum data = datum[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: data.backgroundGradientColors
                                .map(
                                  (colorCode) => Color(
                                    int.parse(
                                      '0x$colorCode',
                                    ),
                                  ),
                                )
                                .toList(),
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        margin: const EdgeInsets.all(8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network(
                                  data.displayIcon,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Name: ${data.displayName}"),
                              Text("Devaloper name: ${data.developerName}"),
                            ]),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No results found'));
          }
        },
      ),
    );
  }
}
