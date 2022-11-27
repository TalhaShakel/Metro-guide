import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/on_boarding/otp.dart';
class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _key,
          child: SingleChildScrollView(
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
    "Forget Password",
    style: GoogleFonts.poppins(
            fontSize: 24, fontWeight: FontWeight.w600),
  ),
  SizedBox(height: 40,),
  Text(
    " Please enter your email address linked to \n    your account. We will send OTP to this \n           email account for verification.",
    style: GoogleFonts.poppins(
            fontSize: 14, color: Color(0xff8B9EB0)),
  ),
  SizedBox(height: 40,),
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
  SizedBox(height: 80,),
  Padding(
    padding: const EdgeInsets.only(left: 50,right: 50),
    child: GestureDetector(
      onTap: ()async{
            EmailAuth.sessionName='Test Session';
            var res = await EmailAuth.sendOtp(receiverMail: _email.text);
            if (res){
              print('Otp sent');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Otp Sent Successfully",
                style: GoogleFonts.poppins(
                    color: Colors.white),),backgroundColor: Color(0xff77E77B),));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Otp(email:_email.text)));
            }else{
              print('We could not sent Otp');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("We couldn't sent Otp Enter Email Again",
                style: GoogleFonts.poppins(
                    color: Colors.white
                ),),backgroundColor: Colors.red,));
            }
      },
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
                  "Send",
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
      ),
    );
  }
}
