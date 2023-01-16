import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/providers/score_provider.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/widgets/loading_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Utils/size_config.dart';

class Scores extends ConsumerStatefulWidget {
  static const routeName = "/scores-screen";

  const Scores({super.key});

  @override
  ConsumerState<Scores> createState() => ScoresState();
}

class ScoresState extends ConsumerState<Scores> {
  int r = 1;
  var rank = Data.topRanks;
  String? rr;
  String? rankdata() {
    (r) < 3 ? rr = rank[r - 1] + r.toString() : rr = r.toString();
    r++;
    return rr;
  }

  List<DataRow> _createRows(QuerySnapshot snapshot) {
    List<DataRow> newScore = snapshot.docs
        .map((DocumentSnapshot documentSnapshot) => DataRow(
                color: MaterialStateColor.resolveWith((states) {
                  if (Data.loggedin &&
                      documentSnapshot['email'] ==
                          ref.watch(newUserDataProivder)!.email) {
                    return Colors.cyan;
                  } else {
                    return Colors.transparent;
                  }
                }),
                cells: [
                  DataCell(Text(
                    rankdata() ?? "0",
                    style: GoogleFonts.kanit(fontSize: getProportionateScreenWidth(15), color: Colors.white),
                  )),
                  DataCell(Text(
                    documentSnapshot['email'],
                    style: GoogleFonts.kanit(fontSize: getProportionateScreenWidth(15), color: Colors.white),
                  )),
                  DataCell(Text("    "+
                    DateFormat('yyyy-MM-dd').format(
                        (documentSnapshot['date'] as Timestamp).toDate()),
                    style: GoogleFonts.kanit(fontSize: getProportionateScreenWidth(15), color: Colors.white),
                  )),
                  DataCell(Text(
                    '      ${documentSnapshot['score']}',
                    style: GoogleFonts.kanit(fontSize: getProportionateScreenWidth(15), color: Colors.white),
                  ))
                ]))
        .toList();
    return newScore;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Scores')
                .where('typeofgame', isEqualTo: ref.watch(typeofgameProivder))
                .orderBy('score', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final allScores = snapshot.data!;
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Column(children: [
                          Text(
                            'High Scores',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.patrickHand(
                                fontSize: getProportionateScreenWidth(60), color: Colors.white),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(60),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DataTable(
                          columnSpacing: 5,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Rank',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20), color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '        Email',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20), color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '     Date',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20), color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '    Score',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20), color: Colors.white),
                              ),
                            ),
                          ],
                          rows: _createRows(allScores),
                        )
                      ],
                    ),
                  ],
                );
              } else {
                return const LoadingWidget();
              }
            }),
      ),
    );
  }
}
