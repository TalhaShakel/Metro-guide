import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountCodes extends StatelessWidget {
   DiscountCodes({Key? key}) : super(key: key);
  TextEditingController _discountcode= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text("Discount Codes",style: TextStyle(
            fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Discount Codes",style: TextStyle(
                      fontWeight: FontWeight.w400,color: Colors.black,fontSize: 18
                  ),),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffEAEAEA)),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Center(
                  child: TextFormField(
                    controller: _discountcode,
                    cursorColor: Color(0xff777777),
                    decoration: InputDecoration(
                        hintText: "Enter Discount Code",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () async {
                if (_discountcode.text.isNotEmpty) {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid).collection('orders').doc(FirebaseAuth.instance.currentUser!.uid).
                collection('DiscountCode').doc()
                      .set({
                    "discountcode": _discountcode.text,

                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Discount Code Added",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    backgroundColor: Color(0xff77E77B),
                  ));
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Stations()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter Code",
                        style: GoogleFonts.poppins(
                            color: Colors.white),
                      ),
                        backgroundColor: Colors.red,
                      ));
                }
              },
              // onTap: (){
              //   Navigator.pop(context);
              // },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  color: Color(0xff1D68CD),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text("Submit",style: TextStyle(
                      fontWeight: FontWeight.w500,color: Colors.white,fontSize: 18
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
