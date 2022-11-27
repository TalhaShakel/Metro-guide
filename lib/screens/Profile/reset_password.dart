import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/screens/Profile/profile.dart';

class ResetPassword extends StatefulWidget {
  var data;
   ResetPassword({Key? key,required this.data}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _password.text=widget.data["password"]??"";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50,left: 20),
                        child: Icon(Icons.arrow_back_ios),
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
                "Reset Password",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40,),
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
                ),
              ),
              SizedBox(height: 80,),
              GestureDetector(
                onTap: ()async{
                  if(_key.currentState!.validate()){
                    try{
                      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update(
                          {
                            'password':_password.text,
                          }
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is Updated")));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                    }catch(e){
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Occur enter Again")));
                    }
                  }},
                child: Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50),
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
                          "Reset",
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
            ],
          ),
        ),
      ),
    );
  }
}
