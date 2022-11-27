import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/screens/TicketScreen/payment_method.dart';

import 'billing_address.dart';
import 'billing_summary.dart';
import 'discount_codes.dart';
import 'order_review.dart';
class BuyTickets extends StatefulWidget {
  var price;
   BuyTickets({Key? key,required this.price}) : super(key: key);
  @override
  State<BuyTickets> createState() => _BuyTicketsState();
}
class _BuyTicketsState extends State<BuyTickets> {
  bool isChecked = false;
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
        title: Text(widget.price['Duration'],style: TextStyle(
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
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BillingAddress()));
                },
                child: Card(
                  child: ListTile(
                    title: Text("Billing Address",style: TextStyle(
                        fontWeight: FontWeight.w400,color: Colors.black,fontSize: 20
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentMethod()));
                },
                child: Card(
                  child: ListTile(
                    title: Text("Payment Method",style: TextStyle(
                        fontWeight: FontWeight.w400,color: Colors.black,fontSize: 20
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                  ),
                ),
              ),
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderReview()));
              //   },
              //   child: Card(
              //     child: ListTile(
              //       title: Text("Order Review",style: TextStyle(
              //           fontWeight: FontWeight.w400,color: Colors.black,fontSize: 20
              //       ),),
              //       subtitle: Text("3 items in card",style: TextStyle(
              //           fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15
              //       ),),
              //       trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DiscountCodes()));
                },
                child: Card(
                  child: ListTile(
                    title: Text("Discount Codes",style: TextStyle(
                        fontWeight: FontWeight.w400,color: Colors.black,fontSize: 20
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BillingSummary(price:widget.price)));
                },
                child: Card(
                  child: ListTile(
                    title: Text("Billing Summary",style: TextStyle(
                        fontWeight: FontWeight.w400,color: Colors.black,fontSize: 20
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("Grand Total",style: TextStyle(
                        fontWeight: FontWeight.w500,color: Colors.black,fontSize: 22
                    ),),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(widget.price['Price'],style: TextStyle(
                        fontWeight: FontWeight.w500,color: Colors.black,fontSize: 22
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Order Comment",style: TextStyle(
                        fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 18
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffEAEAEA)),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Center(
                    child: TextFormField(
                      cursorColor: Color(0xff777777),
                      decoration: InputDecoration(
                        hintText: "Type Here",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() => isChecked = value!);
                    },
                    activeColor: Color(0xff1D68CD),
                    checkColor: Colors.white,
                  ),

                  Text("Please check our  ",style: TextStyle(
                      fontWeight: FontWeight.w400,color: Colors.black,fontSize: 12
                  ),),
                  Text(" Privacy & Terms Policy",style: TextStyle(
                      fontWeight: FontWeight.w400,color: Color(0xff1D68CD),fontSize: 12
                  ),),
                ],
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: ()async{
                  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance
                  .currentUser!.uid).collection('orders').doc().set({
                    "order":widget.price['Price'],
                    "Duration":widget.price['Duration'],
                    "type":widget.price['type']
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Ticket Purchased",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    backgroundColor: Color(0xff77E77B),
                  ));
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff1D68CD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text("Pay Now",style: TextStyle(
                        fontWeight: FontWeight.w500,color: Colors.white,fontSize: 18
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Image.asset("assets/images/nortonLogo.png",height: 40,),
              SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}
