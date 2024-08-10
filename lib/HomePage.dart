import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int xscore=0;
  int oscore=0;
  int countBox=0;

  //google fonts
  static var MyFonts = GoogleFonts.lato(
    textStyle: const TextStyle(color: Colors.white, fontSize: 19, letterSpacing: 3),
  );
  static var MyFontsWhite = GoogleFonts.lato(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 25),
  );


  bool otrun=true;//first turn is of o
  List<String> displayXO=['','','','','','','','',''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        children: [


          Expanded(
              child:Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player X",style: MyFonts,),
                          Text(xscore.toString(),style:MyFonts,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("Player O",style: MyFonts,),
                          Text( oscore.toString(),style: MyFonts,),
                        ],
                      ),
                    ),
                  ],
                ),)
          ),

          Expanded(
            flex: 3,//what flex do???????????????????????????????????????
            child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext,int index){
                  return GestureDetector(
                    onTap: (){
                      _tapped(index);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text(displayXO[index],style: const TextStyle(color: Colors.white,fontSize: 40),),
                        )
                    ),
                  );
                }
            ),
         ),

          Expanded(
            child:Container(
              child: Text("TIC_TAC_TOE",style: MyFontsWhite),
            ),
          ),
        ],
      ),
    );
  }
  void _tapped(index){
    setState(() {
      if(otrun && displayXO[index]==''){
        displayXO[index]='O';
        countBox++;
      }else if(!otrun && displayXO[index]==''){
        displayXO[index]='X';
        countBox++;
      }
      otrun=!otrun;//false->true->false.....
      _checkWinner();
    });
  }
//checking the index to win
  void _checkWinner(){

    //012
    //345
    //678
    //index---0,1,2
    if( displayXO[0]==displayXO[1] &&
        displayXO[0]==displayXO[2] &&
        displayXO[0]!='') {
      _showinDialog(displayXO[0]);
    }

    //index---0,3,6
    if( displayXO[0]==displayXO[3] &&
        displayXO[0]==displayXO[6] &&
        displayXO[0]!='') {
      _showinDialog(displayXO[0]);
    }
    //index---0,4,8
    if( displayXO[0]==displayXO[4] &&
        displayXO[0]==displayXO[8] &&
        displayXO[0]!='') {
      _showinDialog(displayXO[0]);
    }

    //index---1,4,7
    if( displayXO[1]==displayXO[4] &&
        displayXO[1]==displayXO[7] &&
        displayXO[1]!='') {
      _showinDialog(displayXO[1]);
    }
    //index---2,5,8
    if( displayXO[2]==displayXO[5] &&
        displayXO[2]==displayXO[8] &&
        displayXO[2]!='') {
      _showinDialog(displayXO[2]);
    }
    //index---3,4,5
    if( displayXO[3]==displayXO[4] &&
        displayXO[3]==displayXO[5] &&
        displayXO[3]!='') {
      _showinDialog(displayXO[3]);
    }
    //index---6,7,8
    if( displayXO[6]==displayXO[7] &&
        displayXO[6]==displayXO[8] &&
        displayXO[6]!='') {
      _showinDialog(displayXO[6]);
    }

    //index---2,4,6
    if( displayXO[2]==displayXO[4] &&
        displayXO[2]==displayXO[6] &&
        displayXO[2]!='') {
      _showinDialog(displayXO[2]);
    }
    else if(countBox==9){
      _showDrawDialog();
    }

  }
  void _clearBoard(){
    //clear kena hai board ko
    //toh we want every index or i should be cleared so loop of 9
    setState(() {
      for(int i=0;i<9;i++){
        displayXO[i]='';
      }
      countBox=0;
    });

  }

  void _showinDialog(String winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("WINNER! $winner"),
            actions: [
              FloatingActionButton(
                onPressed:(){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text("Playing Again!"),
              )
            ],
          );
        }
    );
    if(winner=='X'){
      xscore++;
    }else if(winner=='O'){
      oscore++;
    }

  }
  //Draw
  void _showDrawDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Draw!"),
            actions: [
              FloatingActionButton(
                onPressed:(){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text("Playing Again!"),
              )
            ],
          );
        }
    );


  }


}
