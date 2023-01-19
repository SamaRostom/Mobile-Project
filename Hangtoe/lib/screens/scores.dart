import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/score_provider.dart';
import 'package:flutter_application_1/widgets/loading_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Utils/size_config.dart';
import '../services/score_service.dart';

class Scores extends ConsumerStatefulWidget {
  static const routeName = "/scores-screen";

  const Scores({super.key});

  @override
  ConsumerState<Scores> createState() => ScoresState();
}

class ScoresState extends ConsumerState<Scores> {

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
                                fontSize: getProportionateScreenWidth(60),
                                color: Colors.white),
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
                          columnSpacing: 3,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Rank',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '        Email',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '     Date',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '    Score',
                                style: GoogleFonts.patrickHand(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: Colors.white),
                              ),
                            ),
                          ],
                          rows: ScoreService.createRows(ref,allScores),
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
