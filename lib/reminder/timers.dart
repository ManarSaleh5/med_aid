import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:awesome_notifications/awesome_notifications.dart';
import '../reminder/notification.dart';
import '../reminder/reminder1.dart';

import '../http.dart';
List<String> timerlist=[];

String timer_delete="";
String g="";
String rem="Reminder5";
List<int> ind = [
  1,
];
int change_this=13;
class timer_page extends StatefulWidget {
  @override
  List firstlist;
   timer_page({Key? key, required this.firstlist}) : super(key: key);
  _timer_pageState createState() => _timer_pageState();
}

class _timer_pageState extends State<timer_page> {
List<String> time=[];
var timer = [];
var time1=[];
  

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  //  show_drugs() async {
  //     var result = await http_get("showdrugs", {
  //     "id": widget.id,
  //     "name":widget.categories,
  //   });
  //   if(result.data.toString()!="not found"){

 
  //   myinfo = result.data.split("&");
  //    for(int i=0;i<myinfo.length;i++)
  //    if(myinfo[i]!="")
  //     drug_list.add(myinfo[i]);
  //    print(myinfo);
  //   setState(() {});
  // }}

  dtimer() async {
    // var data = utf8.encode(textfieldsStrings[1]); // data being hashed
    // var hashvalue = sha1.convert(data);

    var result = await http_get("delete_timer", {
        "id": widget.firstlist[1],
      "timrr":timer_delete,
      
      
    });

      //num=result.data;
    //setState(() {});
  }
   show_time() async {
    time1=[];
      var result = await http_get("get_timer", {
      "id": widget.firstlist[1],
    });

   time= result.data.split("&");
   for(int i=0;i<time.length;i++)
   if(time[i]!="")
   time1.add(time[i]);
    print("iii");
    print(time1);
     // shift= myinfo[0];
    
    setState(() {});
  }
   void initState() {
show_time() ;
time1=[];
DateTime date = DateTime.now();
notify.create_notification(widget.firstlist[2],date.weekday,5,rem);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.firstlist);
    g=widget.firstlist[0].replaceAll("[","");
     g=g.replaceAll("]","");
    timerlist=g.split(",");
   
   
    print("hhjj");
    print(timerlist.length);
    print("mmmm");
    print(widget.firstlist[2]);
      Size size = MediaQuery.of(context).size;
    final deviceHeight = MediaQuery.of(context).size.height - 60.0;
final focus = FocusScope.of(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
       appBar: AppBar(
          backgroundColor: Color(0xFF91c4aa),
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
              Navigator.pop(context);
            },
          ),
       title: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Image.asset(
              'assets/images/logoo1-removebg-preview.png',
              fit: BoxFit.cover,
            ),

            //
          ),
        ),
          actions: [
         
          ]),
          



        body:SingleChildScrollView( child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.01,
                            right: size.width * 0.02,
                            left: size.width * 0.02),
                        child: Text(
                            'You\'ve set these timers',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.055,
                              color: Color.fromARGB(255, 19, 33, 55),
                            )),
                      ),
                      for (int ii = 0; ii < time1.length; ii++)
                         test(context, size, ii),
                    
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.width * 0.03,
                        ),
                      ),
                    ],
                  ),),
       
          );
          

  }

 Widget test(BuildContext context, Size size, int i) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.03,
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.05,
          ),
        ),
        Container(
          width: size.width * 0.3,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 60.0),
            ],
            image: DecorationImage(
                image: AssetImage("assets/images/medtime.png"),
                fit: BoxFit.cover),
                
          ),
          
        
       
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.099,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(),
              child: Text(
               time1[i],
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 19, 33, 55),
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
                  IconButton(
                      icon: Icon( Icons.cancel_outlined, size: 40,),                                                                                   
                   onPressed: (){  
                  
            timer_delete=time1[i];
              print(timer_delete);
              dtimer();
              show_time() ;

    },
      
    ),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.height * 0.04,
          ),
        ),
        AnimatedPadding(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.only(
              top: size.height * 0.04, bottom: size.height * 0.05),
          
        ),
      ],
    ));
  }

  }