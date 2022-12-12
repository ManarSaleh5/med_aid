import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:gp1_med_aid/homepage/home_screen.dart';
import 'package:gp1_med_aid/http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
 import '../main.dart';


class signup extends StatefulWidget {
  @override
  //  List firstlist;
  // signup({Key? key, required this.firstlist}) : super(key: key);
   List firstlist;
  signup({Key? key, required this.firstlist}) : super(key: key);
  // signup({Key? key}) : super(key: key);
  State<StatefulWidget> createState() => signupSt();
}
class signupSt extends State<signup> {
  @override
  TextEditingController dateinput = TextEditingController(); 
  //  void initState() {
  //   super.initState();

  //   // Start listening to changes.
  //   dateinput.addListener();
  // }
 createUser() async {
var result = await http_post("create-user", {
      "name": widget.firstlist[0],
      "email": widget.firstlist[1],
      "password": widget.firstlist[2],
      "city":textfieldsStrings2[0], //city //widget.firstlist[3],
       "town":  textfieldsStrings2[1], //town //widget.firstlist[4],
       "street":textfieldsStrings2[2], //street //widget.firstlist[5],
      "phone": textfieldsStrings2[3], //street//widget.firstlist[6],
    
    
    });
      if (result.ok) {
var response = result.data['status'];}
 print(result.data['status'].toString());
 }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    dateinput.dispose();
    super.dispose();
  }

  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  String city="";
   String v="";
    String b="";
     String n="";
     List textfieldsStrings2 = [
    "", //city
    "", //town 
    "", //street
    "", //phone 
  
  ];
       GlobalKey<FormState>citykey =GlobalKey();
   GlobalKey<FormState>twonKey=GlobalKey();
   GlobalKey<FormState>streetKey =GlobalKey();
     GlobalKey<FormState>phonekey =GlobalKey();
   
// ss() async {
//     // var result = await http_get("hi",{
//     //   "d":city,
//     // });
    
    
//     //  Navigator.pushReplacement(context, MaterialPageRoute(
//     //     builder: (context) =>home ()
//     //   )
//     // );
  
//    // setState(() {});
//   }


  Widget build(BuildContext context) {
      return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/im1g.png"),
                  fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF91c4aa).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    SizedBox(
                      height: 5,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(true),
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 179 : 225,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 400 : 260,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                     
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                           
                          ),
                        )
                      ],
                    ),
                   if (isSignupScreen) buildSignupSection(),
                   // if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          
        ],
      ),
    );}
  
      Container buildSignupSection() {
         Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.only(top: 2),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
           buildTextField( Icons.location_on, "City ",
               false, false,city,0),
             
           buildTextField(
               Icons.location_on, "town", false, true,v,1),
           buildTextField(
              Icons.location_on, "street ", false, false,b,2),
             buildTextField1(
             CommunityMaterialIcons.phone, "phone number  ", false, false,
             
               (valuephone) {
                            if (valuephone.length < 9||valuephone.length > 10) {
                              buildSnackError(
                                'Invalid phone number',
                                context,
                                size,
                              );
                              return '';
                            }
                            if (!RegExp(
                                   (r"^(?:[+0]9)?[0-9]{10}$"))
                                .hasMatch(valuephone)) {
                              buildSnackError(
                                'Invalid phone number',
                                context,
                                size,
                              );
                              return '';
                            }

                            return null;
                          },
                 phonekey,
                   n,3
             
             
             
             ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
          ),
        
            
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle( fontSize: 14,color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "term & conditions",
                      style: TextStyle(fontSize: 15,color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
         }
    TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

      Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                   decoration: BoxDecoration(
                      /* gradient: LinearGradient(
                         //  colors: [Colors.orange[200], Colors.red[400]],
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight),*/
                       borderRadius: BorderRadius.circular(30),
                       boxShadow: [
                         BoxShadow(
                             color: Colors.black.withOpacity(.3),
                             spreadRadius: 1,
                             blurRadius: 2,
                             offset: Offset(0, 1))
                       ]),
                               child: IconButton(
                      icon: Icon( Icons.arrow_forward, color: Colors.white,),
                    onPressed: (){ 
                     if(phonekey.currentState!.validate()){
     Navigator.push(
         context,
         MaterialPageRoute(
          builder: (_) => MyStatefulWidget(
                          firstlist: [
                          //  widget.firstlist[ 0], //name
                          //  widget.firstlist[1], //email
                          //  widget.firstlist[2], //password
                          //  textfieldsStrings2[0], //city
                          //  textfieldsStrings2[1], //town
                          //  textfieldsStrings2[2], //street
                          //  textfieldsStrings2[3], //phone
                                                    ],

          )));
    }
                   
   createUser();
    },
      
    ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail,String str,int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
           onChanged: (value) {
              setState(() {
                textfieldsStrings2[i] = value;
              });
            },

        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );   
          
  }
   Widget buildTextField1(
      IconData icon, String hintText, bool isPassword, bool isEmail, FormFieldValidator validator,
       Key key,
      String str,int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      //child: TextField(
         child: Form(
          key: key,
          child: TextFormField(
       onChanged: (value) {
              setState(() {
                textfieldsStrings2[i] = value;
              });
            },
           //
           validator: validator,
         

        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    )  
    );      
  }


    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Color.fromARGB(255, 42, 94, 68),
        content: SizedBox(
          height: size.height * 0.03,
          child: Center(
            child: Text(error,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 218, 226, 238),
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ),
    );
  }
}
 class Palette {
 static const Color iconColor = Color(0xFFB6C7D1);
 static const Color activeColor = Color(0xFF09126C);
 static const Color textColor1 = Color(0XFFA7BCC7);
 static const Color textColor2 = Color(0XFF9BB3C0);
 static const Color facebookColor = Color(0xFF3B5999);
 static const Color googleColor = Color(0xFFDE4B39);
 static const Color backgroundColor = Color(0xFFECF3F9);
}


  
 

 