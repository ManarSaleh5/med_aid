import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:gp1_med_aid/homepage/home_screen.dart';
import 'package:gp1_med_aid/sign%20and%20log/sign_up2.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'start_screen.dart';
import 'package:gp1_med_aid/http.dart';
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String _title = 'Med Aid';
 
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
     home: SplashScreen(),
      title: _title,
      // home: Scaffold(
      //   // appBar: AppBar(backgroundColor: Color.fromARGB(255, 42, 94, 68),
      //   //   title:Text(_title,style: TextStyle(color: Color(0xFF91c4aa)),),),
      //   body: const MyStatefulWidget(),
      //  ),
    );
 }
}
 
class MyStatefulWidget extends StatefulWidget {
  //const MyStatefulWidget({Key? key}) : super(key: key);
  List firstlist;
  MyStatefulWidget({Key? key, required this.firstlist}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
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
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
TextEditingController dateinput = TextEditingController(); 
  bool isSignupScreen = true;
  bool isMale = true;
 bool signs=false;
  bool isRememberMe = false;
  String name="";
  String email="";
  String password="";
   GlobalKey<FormState>namekey =GlobalKey();
   GlobalKey<FormState>emailKey=GlobalKey();
   GlobalKey<FormState>passwordKey =GlobalKey();
   List textfieldsStrings = [
    "", //Name
    "", //email
    "",//password
    ];
      List textfieldsStrings1= [
    "", //email
    "",//password
    ]; 
  //final _namekey = GlobalKey<FormState>();
 // final _lastNamekey = GlobalKey<FormState>();

 // final _confirmPasswordKey = GlobalKey<FormState>();
  userlogin() async {
var result = await http_get("userlog", {
      
      "email":textfieldsStrings1[0],
      "password": textfieldsStrings1[1],
      
    
    
    });
    print(result.data);
      if (result.data=="email or password are not correct") {
               buildSnackError(
                              'email or password are not correct ',
                              context,
                              MediaQuery.of(context).size*0.7,
                            );
  Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MyStatefulWidget(
               firstlist: [],
                )));

}
else{    
  print(result.data);
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => home(
                             firstlist: [
                                // firstlist: [
                                  textfieldsStrings1[0],
                                  textfieldsStrings1[1],
                                  result.data,
                                  
                                //   textfieldsStrings[2],
                                //  // hashvalue.toString(),
                                 ],
                              )));
}
 
 }
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
                    RichText(
                      text: TextSpan(
                          text: "Welcome ",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                             color: Color.fromARGB(255, 42, 94, 68),
                          ),
                          children: [
                              
                            TextSpan(
                              text: isSignupScreen ? " to MED AID," : " Back,",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                 color: Color.fromARGB(255, 42, 94, 68),
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                         fontSize: 17,
                         fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
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
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color(0xFF91c4aa),
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(bottom:6),
                                  height: 2,
                                  width: 55,
                                  color: Color(0xFF91c4aa),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 190,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       buildTextButton(CommunityMaterialIcons.facebook,
                           "Facebook", Color.fromARGB(255, 109, 132, 182)),
                       buildTextButton(CommunityMaterialIcons.google_plus,
                           "Google", Color.fromARGB(255, 216, 98, 83)),
                     ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    signs=false;
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField1(Icons.mail_outline, "info@gmail.com", false, true,0),
           buildTextField1(
              CommunityMaterialIcons.lock_outline, "**********", true, false,1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("Remember me",
                      style: TextStyle(fontSize: 15, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(fontSize: 15, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }
  

  Container buildSignupSection() {
     Size size = MediaQuery.of(context).size;
     signs=true;
    return Container(
      //margin: EdgeInsets.only(top: 2),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
           buildTextField(CommunityMaterialIcons.account_outline, "User_Name",
               false, false,0,
               (valuesurname) {
                if(valuesurname==" "){
                    buildSnackError(
                              'required information ',
                              context,
                              size,
                            );
                }
                          if (valuesurname.length <= 2) {
                            buildSnackError(
                              'Invalid name',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                          
                        },
               
                      namekey,
                  
              name
               
               
               ),
              //   buildTextField(CommunityMaterialIcons.location_enter, "location ",
              //  false, false),
               
             
           buildTextField(
               CommunityMaterialIcons.email_outline, "email", false, true,1,
              // validator: EmailValidator(errorText: 'enter a valid email address'),
               (valuemail) {
                            if (valuemail.length < 5) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(valuemail)) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }

                            return null;
                          },
                  emailKey,
                   email
               
               ),
           buildTextField(
             CommunityMaterialIcons.lock_outline, "password", true, false,2,
             
              (valuepassword) {
                            if (valuepassword.length < 6) {
                              buildSnackError(
                                'Invalid password',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
             passwordKey ,
             password
             
             ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Palette.textColor2
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Colors.transparent
                                    : Palette.textColor1),
                            borderRadius: BorderRadius.circular(15)),
                         child: Icon(
                           CommunityMaterialIcons.account_outline,
                           color: isMale ? Colors.white : Palette.iconColor,
                         ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor2,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Palette.textColor1
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                         child: Icon(
                           CommunityMaterialIcons.account_outline,
                           color: isMale ? Palette.iconColor : Colors.white,
                         ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
      onPressed: () {  },
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
                     if (isSignupScreen){
                    
                      if(namekey.currentState!.validate()){
                        if (emailKey.currentState!.validate()) {
                           if (passwordKey.currentState!.validate()){
                      
    //                    Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) =>signup()
    //   )
    // );

    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => signup(
                                firstlist: [
                                  textfieldsStrings[0],
                                  textfieldsStrings[1],
                                  textfieldsStrings[2],
                                 // hashvalue.toString(),
                                ],
                              )));
    }
    }
    }}
   if (!isSignupScreen){
      userlogin();
 
   }
    },
      
    ),
           
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail, int i,
      FormFieldValidator validator,
       Key key,
      String str
      ) {
         Size size = MediaQuery.of(context).size;
        
      
    return Padding(
     
                  
      padding: const EdgeInsets.only(bottom: 8.0),

     // child: TextField(
        child: Form(
          key: key,
          child: TextFormField(
       onChanged: (value) {
              setState(() {
                 textfieldsStrings[i]= value;
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
       
       ),
       ); 
    // validator: validator;  
          
  }
  
   Widget buildTextField1(
      IconData icon, String hintText, bool isPassword, bool isEmail, int i,) {
    return Padding(
       
                    
      padding: const EdgeInsets.only(bottom: 8.0),
      //child: TextField(
         child: Form(
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                 textfieldsStrings1[i]= value;
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
    ),);   
          
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