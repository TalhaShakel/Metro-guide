import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}
enum Data { Paypal,BankCard}


class _PaymentMethodState extends State<PaymentMethod> {
  TextEditingController _cardnumber = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _cardcode = TextEditingController();
  Data? _data = Data.BankCard;
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
        title: Text("Payment Method",style: TextStyle(
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
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 65,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffEAEAEA)),
                  color: Colors.white
                ),
                child: Row(
                  children: [
                    Radio(
                        value: Data.Paypal,
                        toggleable: true,
                        groupValue: _data,
                        onChanged: (Data? value) {
                          setState(() {
                            _data = value;
                          });
                        }),
                    Text("PayPal",style: TextStyle(
                        fontWeight: FontWeight.w400,color: Colors.black,fontSize: 18
                    ),),
                    Spacer(),
                    Text("You will be redirected to the PayPal \nwebsite after submitting your order",style: TextStyle(
                        fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 10
                    ),),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("assets/images/paymentLogo.png",height: 28,),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 270,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xffEAEAEA)),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: Data.BankCard,
                            groupValue: _data,
                            toggleable: true,
                            onChanged: (Data? value) {
                              setState(() {
                                _data = value;
                              });
                            }),
                        Text("Pay with Credit Card",style: TextStyle(
                            fontWeight: FontWeight.w400,color: Colors.black,fontSize: 16
                        ),),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset("assets/images/Visa.png",height: 25,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset("assets/images/masterCard.png",height: 25,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Image.asset("assets/images/Discover.png",height: 25,),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 40,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffEAEAEA)),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 10,bottom: 4),
                        child: TextFormField(
                          controller: _cardnumber,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Card Number",
                            hintStyle: TextStyle(
                              fontSize: 14,color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 40,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffEAEAEA)),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 10,bottom: 4),
                        child: TextFormField(
                          controller: _date,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "MM/YY",
                            hintStyle: TextStyle(
                              fontSize: 14,color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 40,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffEAEAEA)),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 10,bottom: 4),
                        child: TextFormField(
                          controller: _cardcode,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Card Security Code",
                            hintStyle: TextStyle(
                              fontSize: 14,color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () async {
                        if (_cardnumber.text.isNotEmpty &&
                            _cardcode.text.isNotEmpty &&
                            _date.text.isNotEmpty) {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid).collection('orders').
                          doc(FirebaseAuth.instance.
                          currentUser!.uid).collection('Payment Method').doc()
                              .set({
                            "cardnumber": _cardnumber.text,
                            "date": _date.text,
                            "cardcode": _cardcode.text,
                            "card":_data.toString(),
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Payment Method Added",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            backgroundColor: Color(0xff77E77B),
                          ));
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Stations()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Something is Missing",
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
                        height: 40,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 20,right: 20),
                        decoration: BoxDecoration(
                            color: Color(0xff1D68CD),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text("Submit",style: TextStyle(
                            color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
                          ),),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
