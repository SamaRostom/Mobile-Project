import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/widgets/loading_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/seemoregames_model.dart';
import '../services/seemoregames_service.dart';

class SeeMoreGames extends StatefulWidget {
  const SeeMoreGames({super.key});

  @override
  State<StatefulWidget> createState() => _SeeMoreGamesState();
}
class _SeeMoreGamesState extends State<SeeMoreGames> {
  List<SeeMoreGamesModel> des =<SeeMoreGamesModel>[];
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    //fetch data from API
    getData();
  }
  getData() async{
    des = await SeeMoreGamesService().getOrganizations();

    if(des.isNotEmpty){
      setState((){
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: des.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(des[index].title.toString()),
              subtitle: Text(des[index].shortDescription.toString()),
            );
          }
        ),
      ),
      ),
    );
  }
}