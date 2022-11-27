import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:metro_guide/components/bottom_bar.dart';
import 'package:metro_guide/on_boarding/forget.dart';
import 'package:metro_guide/on_boarding/sign_up.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool passwordObscure = true;
  bool medicine = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void userlogin()async{
    await  FirebaseAuth.instance.currentUser;
    if(FirebaseAuth.instance.currentUser!.uid.isNotEmpty){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => BottomBar()),
              (route) => false);
    }
    else
    {
// Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }
  void initState(){
    super.initState();
    userlogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                  "Sign In",
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
                      "Email ID",
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
                SizedBox(
                  height: 30,
                ),
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
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',

                      hintStyle:
                          GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
                      // suffixIcon: Padding(
                      //   padding: const EdgeInsets.only(top: 0),
                      //   child: IconButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         passwordObscure = !passwordObscure;
                      //       });
                      //     },
                      //     icon: passwordObscure
                      //         ? const Icon(
                      //       Icons.visibility_off_sharp,
                      //       color: Color(0xff90A4AE),
                      //       size: 16,
                      //     )
                      //         : const Icon(
                      //       Icons.visibility,
                      //       color: Color(0xff90A4AE),
                      //       size: 16,
                      //     ),
                      //   ),
                      // ),
                    ),
                    validator: (vaL) {
                      return vaL!.isEmpty ? "Please Enter Password" : null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                children: [
                  SizedBox(width: 20,),
                  CustomCheckBox(
                            value: medicine,
                            // shouldShowBorder: true,
                            borderColor: Colors.grey,
                            checkedFillColor:Color(0xff77E77B),
                            uncheckedIconColor: Colors
                                .black,
                            uncheckedIcon: Icons.check,
                            borderRadius: 6,
                            borderWidth: 1,
                            checkBoxSize: 18,
                            onChanged: (val) {
                              setState(() {
                                medicine = val;
                              });
                            }),
                  Text("Save Information",style: GoogleFonts.poppins(color: Colors.grey),),
Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Forget()));
                      },
                      child: Text("Forget Password?",style: GoogleFonts.poppins(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold),)),
                  SizedBox(width: 30,),
                ],
                ),

SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: GestureDetector(
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _email.text, password: _password.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) => BottomBar()),
                          //         (route) => false
                          // );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Logged In",style: GoogleFonts.poppins(
                            color: Colors.white

                          ),),
                          backgroundColor: Color(0xff77E77B),
                          ));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "user-not-found") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Email Not Exist",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                                ));

                          } else if (e.code == "wrong-password") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Incorrect Password",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white),
                                ),
                                backgroundColor: Colors.red,));
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
                            "Log In",
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? ",style: GoogleFonts.poppins(),),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        },
                        child: Text("Register",style: GoogleFonts.poppins(color: Color(0xff77E77B),fontWeight: FontWeight.w600),))

                  ],
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
