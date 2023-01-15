import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/loading_widget.dart';

import '../models/seemoregames_model.dart';
import '../services/seemoregames_service.dart';

class SeeMoreGames extends StatefulWidget {
  static const routeName = "/seemoregames-screen";

  const SeeMoreGames({super.key});

  @override
  State<StatefulWidget> createState() => _SeeMoreGamesState();
}

class _SeeMoreGamesState extends State<SeeMoreGames> {
  List<SeeMoreGamesModel> des = <SeeMoreGamesModel>[];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    des = await SeeMoreGamesService().getData();

    if (des.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("See More Games"),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: LoadingWidget(),
          ),
          child: ListView.builder(
              itemCount: des.length,
              itemBuilder: (context, index) {
                return Container(
                    padding: const EdgeInsets.all(2),
                    height: 140,
                    child: Card(
                      elevation: 5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.network(
                              des[index].thumbnail,
                              width: 200,
                            ),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(des[index].title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )))
                          ]),
                    ));
              }),
        ),
      ),
    );
  }
}
