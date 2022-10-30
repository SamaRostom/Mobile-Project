import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';


class Scores extends StatefulWidget {
  const Scores({super.key});

  @override
  ScoresState createState() => ScoresState();
}

class ScoresState extends State<Scores>{
  var S=Data.Hangscore;
  List<DataRow> _createRows() {
    var rank = Data.topRanks;
    return S
        .map((book) => DataRow(cells: [
              DataCell(Text(book['Rank']-1 < 3 ? rank[book['Rank']-1] + book['Rank'].toString():book['Rank'].toString(), style: const TextStyle(fontSize: 20, color: Colors.white,),)),
              DataCell(Text(book['Name'],style: const TextStyle(fontSize: 20, color: Colors.white,),)),
              DataCell(Text(book['Date'],style: const TextStyle(fontSize: 20, color: Colors.white,),)),
              DataCell(Text('     ${book['Score']}',style: const TextStyle(fontSize: 20, color: Colors.white,),))
            ]))
        .toList();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {Navigator.pop(context); },
                ),
                // ListView(
                //   // padding: const EdgeInsets.all(0),
                //   children: [
                    Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                    Text(
                      'High Scores',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                //   ]
                // ),
               
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                DataTable(
                  columnSpacing: 25,
                  columns: const[
                    DataColumn(
                      label: Text('Rank',style: TextStyle(fontSize: 25, color: Colors.white,),),
                    ),
                    DataColumn(
                      label: Text('Name',style: TextStyle(fontSize: 25, color: Colors.white,),),
                    ),
                    DataColumn(
                      label: Text('Date',style: TextStyle(fontSize: 25, color: Colors.white,),),
                    ),
                    DataColumn(
                      label: Text('Score',style: TextStyle(fontSize: 25, color: Colors.white,),),
                    ),
                  ], 
                  rows: _createRows()

                      //  DataRow(cells: [
                      //     DataCell(Text('1')),
                      //     DataCell(Text('Arshik')),
                      //     DataCell(Text('5644645')),
                      //     DataCell(Text('3')),
                      //  ])
                      // for (var item in Data.scoreslist) {
                      //     // print(item);
                      //     Set<DataRow>(cells: [
                      //     DataCell(item[1][1]),
                      //     DataCell(Text('Arshik')),
                      //     DataCell(Text('5644645')),
                      //     DataCell(Text('3')),
                      //  ])
                      // }


                  )  
              ],
            ),
          ],
          
        ),
      ),
    );
  }
}


