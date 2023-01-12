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
    des = await SeeMoreGamesService().getData();

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
        appBar: AppBar(title: const Text("See More Games"),),
        body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: LoadingWidget(),
        ),
        child:
            ListView.builder(
            itemCount: des.length,
            itemBuilder: (context, index){
              return 
              // Row(
              //   children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Card(
                          semanticContainer: true,
                          color: Colors.black,
                          child: Column(
                            children: <Widget>[
                              Image.network(des[index].thumbnail,height: 30,width: 30,),
                              Text(des[index].title,style: GoogleFonts.patrickHand(color: Colors.white)),
                              Text(des[index].shortDescription,style: GoogleFonts.patrickHand(color: Colors.white)),
                            ],
                          ),
                        ),
                  )
                      // Card(
                      //   child: Column(
                      //     children: <Widget>[
                      //       Image.network(des[index+1].thumbnail),
                      //       Text(des[index+1].title),
                      //       Text(des[index+1].shortDescription),
                      //     ],
                      //   ),
                      // ),
              //   ],
              // )
              ;
              
              // ListTile(
              //   title: Text(des[index].title.toString()),
              //   subtitle: Text(des[index].shortDescription.toString()),
                
              // );
            }
          // ),
          // ],
        ),
      ),
      ),
    );
  }
}