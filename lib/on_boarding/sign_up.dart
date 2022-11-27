import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/components/bottom_bar.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
enum Data { male, female, }


class _SignUpState extends State<SignUp> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _dob = TextEditingController();
  Data? _data = Data.male;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Stack(
                    children:[
                      Container(
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/back.png',height: 125,width: 70,),
                          ],
                        ),
                      )
                    ]
                ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  "Register",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "User Name",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _username,
                    cursorColor: Colors.black54,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: 'Enter Name',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey)),
                    validator: (vaL) {
                      return vaL!.isEmpty ? "Please Enter Username" : null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _email,
                    cursorColor: Colors.black54,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey)),
                    validator: (vaL) {
                      return vaL!.isEmpty ? "Please Enter Email" : null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Phone No",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _number,
                    cursorColor: Colors.black54,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: 'Enter Number',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey)),
                    validator: (vaL) {
                      return vaL!.isEmpty ? "Please Enter Phone No" : null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _password,
                    cursorColor: Colors.black54,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey)),
                    validator: (vaL) {
                      return vaL!.isEmpty ? "Please Enter Password" : null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _password,
                    cursorColor: Colors.black54,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Date Of Birth",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _dob,
                    cursorColor: Colors.black54,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: 'Day/Month/Year',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey)),
                    validator: (vaL) {
                      return vaL!.isEmpty ? "Please Enter Date Of Birth" : null;
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Radio(
                        value: Data.male,
                        activeColor: Colors.black,
                        groupValue: _data,
                        onChanged: (Data?value){
                          setState(() {
                            _data = value;
                          });
                        }
                    ),
                    Text("Male",style: GoogleFonts.poppins(fontSize: 14),),
                    Spacer(),
                    Radio(
                        value: Data.female,
                        activeColor: Colors.black,
                        groupValue: _data,
                        onChanged: (Data?value){
                          setState(() {
                            _data = value;
                          });
                        }
                    ),
                    Text("Female",style: GoogleFonts.poppins(fontSize: 14),),
                    SizedBox(width: 150,),

                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: GestureDetector(
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: _email.text, password: _password.text);
                          if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .set({
                              "password": _password.text,
                              "number":_number.text,
                              "date of birth":_dob.text,
                              "email": _email.text,
                              "username": _username.text,
                              "gender":_data.toString(),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Account Created Successfully",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white
                                  ),),backgroundColor: Color(0xff77E77B),));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomBar()));
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "email-already-in-use") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Email Already Exist",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white),
                                    ),backgroundColor: Colors.red,));
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },

                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                    // },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xff77E77B),
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("------Or------",style: GoogleFonts.poppins(),)
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo g.png")
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo f.png")
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
