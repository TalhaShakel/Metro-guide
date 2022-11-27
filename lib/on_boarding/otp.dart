import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/components/bottom_bar.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatelessWidget {
  String email;
   Otp({Key? key,required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _pin = TextEditingController();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
             SizedBox(height: 60,),
             Text("OTP Verify",style: GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.w400),),
             SizedBox(height: 13,),
             Text("You will get an OTP in",style: GoogleFonts.roboto(fontSize: 17,fontWeight: FontWeight.w400),),
             SizedBox(height: 8,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(email,style: GoogleFonts.roboto(fontSize: 17,fontWeight: FontWeight.w400),),
                 SizedBox(width: 5,),
                 Text("Change",style: GoogleFonts.roboto(color:Color(0xffFE0000),fontSize: 13,fontWeight: FontWeight.w700),),
               ],
             ),
             SizedBox(height: 55,),
             Pinput(
               controller: _pin,
               defaultPinTheme: PinTheme(
                 height: 40,
                 width: 40,
                 decoration:  BoxDecoration(
                   borderRadius: BorderRadius.circular(4),
                   border: Border.all(color: Colors.black),
                 ),
               ),
               focusedPinTheme: PinTheme(
                   height: 45,
                   width: 45,
                   decoration:  BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       border: Border.all(color: Colors.black)
                   )
               ),
               submittedPinTheme: PinTheme(
                 height: 40,
                 width: 40,
                 decoration:  BoxDecoration(
                     color: Color(0xff77E77B).withOpacity(0.30),
                     borderRadius: BorderRadius.circular(5)
                 ),
               ),
               length: 6,
             ),
             SizedBox(height: 40,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("    Enter Valid OTP Number ! \nYou will receive a 6 digit code",style: GoogleFonts.roboto(fontSize: 17,fontWeight: FontWeight.w400),)
               ],
             ),
             SizedBox(height: 39,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Didn’t receive code?",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w400),),
                 SizedBox(width: 5,),
                 Text("Resend",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w500),),
               ],
             ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.only(left: 50,right: 50),
               child: GestureDetector(
                 onTap: (){
                   var res = EmailAuth.validate(receiverMail: email, userOTP: _pin.text);
                   if(res){
                     print('Email Verified');
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email Id is Verified",
                       style: GoogleFonts.poppins(
                           color: Colors.white

                       ),),backgroundColor: Color(0xff77E77B),));
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));

                   }else{
                     print('Invalid Otp');
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Otp",
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
                         "Confirm",
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
