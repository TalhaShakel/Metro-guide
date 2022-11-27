import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingAddress extends StatelessWidget {
  BillingAddress({Key? key}) : super(key: key);
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _code = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _number = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();


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
        title: Text("Billing Address",style: TextStyle(
            fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("First Name",style: TextStyle(
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
                        controller: _name,
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                        validator: (vaL) {
                          return vaL!.isEmpty ? "Please Enter Name" : null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Last Name",style: TextStyle(
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
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Email",style: TextStyle(
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
                        controller: _email,
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                        validator: (vaL) {
                          return vaL!.isEmpty ? "Please Enter Email" : null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Street Address",style: TextStyle(
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
                        controller: _address,
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter Address",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                        validator: (vaL) {
                          return vaL!.isEmpty ? "Please Enter Address" : null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("State/Province",style: TextStyle(
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
                        controller: _state,
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter State",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                        validator: (vaL) {
                          return vaL!.isEmpty ? "Please Enter State" : null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("City",style: TextStyle(
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
                        controller: _city,
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter City",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                        validator: (vaL) {
                          return vaL!.isEmpty ? "Please Enter City" : null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Zip/Postal Code",style: TextStyle(
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
                        controller: _code,
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter Zip",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                        validator: (vaL) {
                          return vaL!.isEmpty ? "Please Enter Zip Code" : null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Phone",style: TextStyle(
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
                        controller: _number,
                        cursorColor: Color(0xff777777),
                        decoration: InputDecoration(
                            hintText: "Enter Phone",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                        validator: (vaL) {
                          return vaL!.isEmpty ? "Please Enter Number" : null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid).collection('orders').doc(FirebaseAuth.instance.
                      currentUser!.uid).collection('Billing Address').doc()
                          .set({
                        "username": _name.text,
                        "email": _email.text,
                        "address": _address.text,
                        "state": _state.text,
                        "city": _city.text,
                        "code": _code.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Billing Address added",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        backgroundColor: Color(0xff77E77B),
                      ));
                      Navigator.pop(context);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Stations()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter Something",
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
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
