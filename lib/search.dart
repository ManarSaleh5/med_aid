
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gp1_med_aid/settings/setting%20.dart';
import 'dart:developer';
//import 'package:gp1_med_aid/chat/chats.dart';
//import 'package:gp1_med_aid/chat/chatai.dart';
import 'package:gp1_med_aid/pharmacy/pharmacy1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp1_med_aid/map1.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../http.dart';
import 'package:gp1_med_aid/homepage/home_screen.dart';
String id = "";
 bool e=false;
bool n=false;
bool ib=false;
bool r=false;
class search_2_screen extends StatefulWidget {
  List firstlist;
  search_2_screen({Key? key, this.animationController, required this.firstlist})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _search_2_screenState createState() => _search_2_screenState();
}

class _search_2_screenState extends State<search_2_screen> {

  String res = "";
  List<String> pharmacy = [];
  TextEditingController _controller = new TextEditingController();

  List index = [];
  String temp = "";
  getdrug() async {
    var result = await http_get("getdrug", {
        "name1": _controller.text,
    });
    res = result.data;
    print(res);
    setState(() {
      if(res.toString()!="not")
      pharmacy = res.split("&");
      else pharmacy=["not found"];
    });
    print(pharmacy);
    }
      @override
  void initState() {
  n=false;
ib=false;
e=false;
r=false;
    super.initState();
  }

  Widget build(BuildContext context) {
    n=false;
    ib=false;
    r=false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF91c4aa),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.height * 0.10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 32, 88, 65),
            ),
            onPressed: () {
              // Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (_) => home(
              //                firstlist: [
              //             widget.firstlist[1],
              //             widget.firstlist[2],
              //             widget.firstlist[0],
              //             widget.firstlist[3],
              //                    ],
              //                 )));
              Navigator.pop(context);
              
            },
          ),
       title: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Image.asset(
              'assets/images/logoo1-removebg-preview.png',
              fit: BoxFit.cover,
            ),

            //
          ),
        ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.height * 0.035,
                  ),
                  child: Text(
                    "Enter the name of the drug you want to search for",
                    style: TextStyle(
                        color: Color.fromARGB(255, 35, 88, 68),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ]),
               Container(
height: 20,
width: 100,


    ),
            TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                                     filled: true, 
    fillColor: Colors.white,                           
                       
                        ),
                        
                    readOnly: false,
                    onTap: () async {
                         
                        setState(() {
                          pharmacy=[];
                        });
                     
                    }),
                IconButton(
                      icon: Icon( Icons.search, size: 50,color: Colors.white),
                   onPressed: (){
                        getdrug();
    },
      
    ),
    Container(
height: 70,
width: 100,


    ),
           
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                
                children: <Widget>[
                  if (!pharmacy.isEmpty)
                    for (int i=0;i<pharmacy.length-1 ;i++)  add_search_pharmacy(context, size , i),
                    //if(pharmacy.isEmpty)e=0,
                   
             
                ],
              
              ),
            ),
            Container(
              height:30,
            ),
               Container(
height: 40,

  child: Text(
                    "Use map to get the closest pharmacy",
                    style: TextStyle(
                        color: Color.fromARGB(255, 35, 88, 68),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500),
                  ),

    ),
    Container(
                                      child: IconButton(
                      icon: Icon( Icons.location_on, size: 37,color:Color.fromARGB(255, 38, 83, 70) ,),
                   onPressed: (){  
                       if (!pharmacy.isEmpty){
                for (int i=0;i<pharmacy.length ;i++){
                    if(pharmacy[i].toString()=="Nour alyousef pharmacy")n=true;
                    if(pharmacy[i].toString()=="IBN-SINA PHARMACY")ib=true;
                    if(pharmacy[i].toString()=="Rafidia Pharmacy")r=true;
                     
                     }
                     }
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>map_page(
                  firstlist: [e,
                  n,ib,r,
                  // widget.firstlist[0],
                  // widget.firstlist[1],
                  // widget.firstlist[2],
                  // widget.firstlist[3],
                  ] ,
                )));
    },
      
    ),
    )
          ],
          
        ),
        
      ),
    );
    
  }
 
    Widget add_search_pharmacy(BuildContext context, Size size, int i) {
    
    return   InkWell(
        onTap: () {

          
                    // callpage(i,context);
          //showAlertDialog(context, sug[i]);
        },
      
           

        child: Padding(
            padding: EdgeInsets.only(left: size.height * 0.03),
            child: Column(
             // child: Row(
         children: <Widget>[
              //children: [
                
                Container(
                  
            
       
                  width: size.width * 0.4,
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(50.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(1.1, 4.0),
                          blurRadius: 8.0),
                    ],
                  ),

              child:Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.4,
                            height: size.width * 0.38,
                            child: SizedBox(
                            child: Image.asset("assets/images/drugs.png"),
                            

                            ),
  

                          ),

                         
                          Text(
                           pharmacy[i],
                            
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 8, 73, 46),
                                fontSize: size.width * 0.044,
                                fontWeight: FontWeight.w600),

                          ),
                           Container(
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                                 child:  IconButton(
                      icon: Icon( Icons.arrow_right, size: 40,),
                   onPressed: (){  
     

    },
      
    ),),

                          
                        ],
                          
                      )
                       ),
                ),
                    
              ],
            
            )));
            
  }
}