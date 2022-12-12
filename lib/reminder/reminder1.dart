import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';


//import 'package:medicine/notifications/notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
final _timePickerTheme = TimePickerThemeData(
  backgroundColor: Colors.white,
  hourMinuteShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Color.fromARGB(255, 32, 88, 65), width: 4),
  ),
  dayPeriodBorderSide: const BorderSide(color: Color.fromARGB(255, 32, 88, 65), width: 4),
  dayPeriodColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Color.fromARGB(255, 32, 88, 65) : Color(0xFF91c4aa)),

  // dayPeriodColor: Color(0xFF91c4aa),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Color.fromARGB(255, 32, 88, 65), width: 4),
  ),
  dayPeriodTextColor: Colors.white,
  dayPeriodShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Color.fromARGB(255, 32, 88, 65), width: 4),
  ),
  hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Color.fromARGB(255, 32, 88, 65) : Color(0xFF91c4aa)),
  hourMinuteTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected) ? Colors.white : Color.fromARGB(255, 32, 88, 65)),
  dialHandColor: Color.fromARGB(255, 32, 88, 65),
  dialBackgroundColor: Color(0xFF91c4aa),
  hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  helpTextStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.all(0),
  ),
  dialTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected) ?Color(0xFF91c4aa) : Colors.white),
  entryModeIconColor: Color.fromARGB(255, 32, 88, 65),
);
 var d = ["Syrup", "Pill", "Capsule","Cream","Syringe"];
       var image = [
    'assets/images/syrup.png',
     'assets/images/pills.png',
      'assets/images/capsule.png',
      'assets/images/cream.png',
      'assets/images/syringe.png',
   
  ];
  

class AddNewMedicine extends StatefulWidget {
  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}

class _AddNewMedicineState extends State<AddNewMedicine> {
 // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  // show time picker method
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // This uses the _timePickerTheme defined above
                timePickerTheme: _timePickerTheme,

            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 32, 88, 65),),
                foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                overlayColor: MaterialStateColor.resolveWith((states) => Color(0xFF91c4aa)),
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //final Snackbar snackbar = Snackbar();

  //medicine types
  final List<String> weightValues = ["pills", "ml", "mg"];

  //list of medicines forms objects



  DateTime setDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();



  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    final deviceHeight = MediaQuery.of(context).size.height - 60.0;
final focus = FocusScope.of(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF91c4aa),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0),
                height: deviceHeight * 0.05,
                child: FittedBox(
                    child: Text(
                  "Add Pills",
                   style: TextStyle(
                        color: Color.fromARGB(255, 35, 88, 68),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                 
                   //   .copyWith(color: Colors.black),
                )),
              ),


                Container(
                  height: 10,
                ),
                Container(
            height: 40,
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: nameController,
            
              
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, 
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  labelText: "Pills Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                      BorderSide(width: 0.5, color: Color.fromARGB(255, 33, 87, 49)))),
              onSubmitted: (val)=>focus.nextFocus(),
            ),
          ),   
             SizedBox(
              height: 20,
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: 40,
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, 
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        labelText: "Pills Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                width: 0.5, color: Color.fromARGB(255, 33, 87, 49)))),
                    onSubmitted: (val)=>focus.unfocus(),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 2,
             
                ),
              )
            ],
          ),

              // SizedBox(
              //   height: deviceHeight * 0.03,
              // ),
          Container(
                height: 25,
                
                
                
                ),
              Container(
                height: 25,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: FittedBox(
                    child: Text(
                      "Medicine form",
                      style: TextStyle(
                          color: Color.fromARGB(255, 15, 41, 16),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
               Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                    //  for (int ii = 0; ii < 3; ii++)
                        for (int i=0;i<5;i++) add_type(context, size , i),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.01))
                    ],
                  ),
                ),
              ],
            ),
              // SizedBox(
              //   height: deviceHeight * 0.02,
              // ),
              Container(
                height: 10,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    
                  ],
                ),
              ),
              // SizedBox(
              //   height: deviceHeight * 0.03,
              // ),
              Container(
                //width: 
                height: 70,
                width:double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
              _timeOfDay.format(context).toString(),
              style: TextStyle(fontSize: 40,color:Color.fromARGB(255, 35, 88, 68), ),
            ),
                 MaterialButton(
           
              onPressed: _showTimePicker,
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Text('PICK TIME',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              color: Color.fromARGB(255, 38, 83, 70),
            ),
                
                  
                    // SizedBox(
                    //   width: 40,
                    // ),
                   
                  ],
                ),
                 
               
              ),
              Spacer(),
              Container(


                  child:         MaterialButton(
           
              onPressed: _showTimePicker,
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Text('DONE',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              color: Color.fromARGB(255, 38, 83, 70),
            ),
                  
                  
                  
                  
                  
                  
                  
                  
                  // Text(
                  //   "Done",
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 153, 60, 60),
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 17.0),
                  // ),
              )
              // Container(
              //   height: 10,
              //   width: double.infinity,
              //   child: 
                  
            
              //      Text(
              //       "Done",
              //       style: TextStyle(
              //           color: Color.fromARGB(255, 153, 60, 60),
              //           fontWeight: FontWeight.w600,
              //           fontSize: 17.0),
              //     ),
                
              // )
            ],
          ),
        ),
      ),
    );
  }
   Widget add_type(BuildContext context, Size size, int i) {
    
    return   InkWell(
        onTap: () {
           decoration: BoxDecoration(
                    color: Color.fromARGB(255, 204, 150, 150),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(1.1, 4.0),
                          blurRadius: 8.0),
                    ],
                  );
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
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
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
                            width: size.width * 0.25,
                            height: size.width * 0.30,
                            child: SizedBox(
                            child: Image.asset( image [i]),
                            

                            ),
  

                          ),

                         
                          Text(
                            d[i] 
                           ,
                            
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
                      icon: Icon( Icons.check, size: 40,),
                   onPressed: (){  
                       decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 124, 124),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(1.1, 4.0),
                          blurRadius: 8.0),
                    ],
                  );
     

    },
      
    ),),
//                            Container(
//                   height: size.height * 0.07,
//                   width: size.width * 0.9,
//                                  child:  IconButton(
//                       icon: Icon( Icons.arrow_right, size: 40,),
//                    onPressed: (){  
     
// // Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //             builder: (_) => ListViewPage(
// //                   name: sug_pharmacy1[i],
                  
// //                 )));
//     },
      
//     ),),

                          
                        ],
                          
                      )
                       ),
                ),
                    
              ],
            
            )));
            
  }
  
  
  
  }