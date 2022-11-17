import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../http.dart';


class edit_profile_page extends StatefulWidget {
  List firstlist;
   edit_profile_page({Key? key, required this.firstlist}) : super(key: key);

  @override
  _edit_profile_pageState createState() => _edit_profile_pageState();
}
List<String> myinfo = [];
String Fullname = '';
String city = '';
String Email = '';
String street= '';
String town= '';
String phone= '';

class _edit_profile_pageState extends State<edit_profile_page> {
  show_accountinfo() async {
      var result = await http_get("accountinfo", {
      "id": widget.firstlist[0],
    });

    myinfo = result.data.split("&");
    Fullname  = myinfo[0];
    city = myinfo[1];
    Email = myinfo[2];
    street = myinfo[3];
    town = myinfo[4];
    phone = myinfo[5];
    setState(() {});
  }

  edit() async {
    print(street);
    var result = await http_post("change-account", {
      "id": widget.firstlist[0],
      "name": Fullname,
      "email": Email,
      "city": city,
      "town": town,
      "street": street,
      "phone": phone,
    });

    setState(() {});
  }

  final TextEditingController txt = TextEditingController();
  DateTime dateTime = DateTime.now();
  final _ageKey = GlobalKey<FormState>();

  @override
  void initState() {
    show_accountinfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF91c4aa),
        toolbarHeight: MediaQuery.of(context).size.height * 0.11,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 42, 94, 68),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
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
              color:Color(0xFF91c4aa),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(245, 245, 245, 245),
        padding: EdgeInsets.only(
            left: size.height * 0.04, right: size.height * 0.04),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.047,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Color.fromARGB(255, 42, 94, 68),
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "Edit Your Profile",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.077,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 34, 88, 62),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.037,
              ),
              buildTextField("First Name", Fullname ),
              buildTextField("E-mail", Email),
              buildTextField("Phone number  ", phone ),
               buildTextField("city ", city ),
               buildTextField("Town ", town ),
               buildTextField("Street ", street ),
              // Text(
              //   "Date of Birth",
              //   style: TextStyle(
              //       fontSize: MediaQuery.of(context).size.width * 0.037,
              //       fontWeight: FontWeight.w600,
              //       color: Color.fromARGB(255, 105, 104, 104)),
              // ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.007)),
              // buildDateField(
              //   date,
              //   false,
              //   size,
              //   (valuesurname) {
              //     if (valuesurname.length <= 2) {
              //       // buildSnackError(
              //       //   'Tab the icon to choose your Date of Birth',
              //       //   context,
              //       //   size,
              //       // );
              //       return '';
              //     }
              //     return null;
              //   },
              //   _ageKey,
              //   1,
              // ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(
                    top: size.height * 0.025,
                    left: size.height * 0.07,
                    right: size.height * 0.07),
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.09,
                  decoration: BoxDecoration(
                      color: Color(0xFF91c4aa),
                      borderRadius: BorderRadius.circular(20)),
                  child:TextButton(
                    onPressed: () {
                       if (fname != '') Fullname = fname;
                      if (phonen != '') phone = phonen;
                      if (email != '') Email = email;
                      if (ccity != '')   city=ccity;
                      if (Town != '') town = Town;
                      if (sstreet != '') street = sstreet;
                      edit();
                    
                    },
                  
                    child: Text(
                      'Save',
                      style: GoogleFonts.satisfy(
                          color: Color(0xff132137),
                          fontSize: size.width * 0.09,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String fname = '';
  String lname = '';
  String email = '';
  String ccity = '';
  String Town = '';
  String sstreet= '';
  String phonen= '';
  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: TextField(
        onChanged: (text) {
          if (placeholder == Fullname) fname = text;
          if (placeholder == Email) email = text;
          if (placeholder == phone) phonen = text;

           if (placeholder == city) ccity = text;
          if (placeholder == town) Town = text;
           if (placeholder == street) sstreet = text;
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.005),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 23, 56, 40), 
            )),
      ),
    );
  }

  bool pwVisible = false;

  Widget buildDateField(
    String hintText,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
  ) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        child: Form(
          key: key,
          child: TextFormField(
            style: TextStyle(color:  Color.fromARGB(255, 23, 56, 40),),
            readOnly: true,
            controller: txt,
            onChanged: (value) {
              setState(() {});
            },
            validator: validator,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              contentPadding: EdgeInsets.only(
                top: size.height * 0.006,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.w500,
                color:  Color.fromARGB(255, 23, 56, 40),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  color:  Color.fromARGB(255, 23, 56, 40),
                  onPressed: () {
                    Utils.showSheet(
                      context,
                      child: buildDatePicker(),
                      onClicked: () {
                        final value = DateFormat('yyyy/MM/dd').format(dateTime);

                        txt.text = value;
                        //date = value;
                        TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500,
                          color:  Color.fromARGB(255, 23, 56, 40),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  icon: Icon(Icons.date_range_rounded),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );
}