// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> matches = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Load JSON data from assets
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/teams.json");
    setState(() {
      matches = json.decode(data);
    });
  }

  String? _selectedItem;

  // Filter matches based on selected item

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 60),
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 33, 33, 33),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0,
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: const Color.fromARGB(255, 201, 201, 201)
                    //         .withOpacity(0.5),
                    //     spreadRadius: 1,
                    //     blurRadius: 4,
                    //     offset: const Offset(0, 1),
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 15, bottom: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child:
                                          Image.asset('assets/images/mpl.png')),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text('Mogarnad Premier League',
                                        style: GoogleFonts.frijole(
                                            textStyle: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 221, 96),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 16),
                                    child: Text('MPL FIXTURES',
                                        style: GoogleFonts.fingerPaint(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                  const SizedBox(height: 7),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       color: Colors
                                  //           .green,
                                  //       borderRadius:
                                  //           BorderRadius.circular(
                                  //               20)),
                                  //   child:
                                  //       Padding(
                                  //     padding: const EdgeInsets
                                  //         .only(
                                  //         left:
                                  //             10,
                                  //         right:
                                  //             10,
                                  //         top: 3,
                                  //         bottom:
                                  //             3),
                                  //     child: Text(
                                  //       'Click Here',
                                  //       style: GoogleFonts.aBeeZee(
                                  //           textStyle:
                                  //               const TextStyle(color: Colors.white)),
                                  //     ),
                                  //   ),
                                  // ),
                                  //    const SizedBox(
                                  //     height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide:
                        const BorderSide(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 0.2,
                          color: Color.fromARGB(
                              255, 193, 193, 193)), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 33, 33, 33),
                ),
                dropdownColor: const Color.fromARGB(255, 33, 33, 33),
                style: const TextStyle(color: Colors.white),
                value: _selectedItem,
                hint: const Text(
                  'Select your item',
                  style: TextStyle(color: Colors.white),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'GS',
                    child: Text(
                      'GS Challengers',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'SHREE DEVI',
                    child: Text(
                      'Shree Devi Attackers',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'RANG WARRIORS',
                    child: Text(
                      'Rang Warriors',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'SHREE WARRIORS',
                    child: Text(
                      'Shree Warriors',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'S.D.C',
                    child: Text(
                      'SDC Shamboor',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value!;
                   // print(_selectedItem); // Printing the selected item
                  });
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: _selectedItem == null
                      ? matches.length
                      : matches
                          .where((match) =>
                              match['teamA'].trim() == _selectedItem ||
                              match['teamB'].trim() == _selectedItem)
                          .length,
                  itemBuilder: (BuildContext context, int index) {
                    // Filter matches based on selected item if it's not null
                    final filteredMatches = _selectedItem == null
                        ? matches
                        : matches
                            .where((match) =>
                                match['teamA'].trim() == _selectedItem ||
                                match['teamB'].trim() == _selectedItem)
                            .toList();

                    final match = filteredMatches[index];
                    final teamA = match['teamA'];
                    final teamB = match['teamB'];
                    final teamAlogo = match['teamAlogo'];
                    final teamBlogo = match['teamBlogo'];

                    // Check if the selected item is in teamA or teamB position
                    final isTeamASelected = teamA == _selectedItem;

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          color: const Color.fromARGB(255, 56, 56, 56),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Text(
                                  '${match['match']}',
                                  style: GoogleFonts.lato(color: Colors.grey),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 36),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/${isTeamASelected ? teamAlogo : teamBlogo}'),
                                            radius: 36,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${isTeamASelected ? teamA : teamB}',
                                            style: GoogleFonts.chelseaMarket(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'VS',
                                    style: GoogleFonts.fingerPaint(
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 255, 250, 249)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 36),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/${isTeamASelected ? teamBlogo : teamAlogo}'),
                                            radius: 36,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${isTeamASelected ? teamB : teamA}',
                                            style: GoogleFonts.chelseaMarket(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  return Card(
//                     child: ListTile(
//                       trailing: Image.asset(
//                           'assets/images/${matches[index]['teamAlogo']}'),
//                       title: Text('Match: ${matches[index]['match']}'),
//                       subtitle: Text(
//                           'Team A: ${matches[index]['teamA']} vs Team B: ${matches[index]['teamB']}'),
//                     ),
//                   );