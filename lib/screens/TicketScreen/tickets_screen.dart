import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/screens/TicketScreen/users.dart';

import 'buy_tickets.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Tickets Package",
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
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
                    "Available Tickets",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: Users.readItem(),
                    builder: (context,snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return CupertinoActivityIndicator();
                      }
                      else if (snapshot.data!.docs.isNotEmpty ) {
                        return Container(
                          height: 470,
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var noteinfo = snapshot.data!.docs[index].data() as Map<
                                  String,
                                  dynamic>;
                              String docId = snapshot.data!.docs[index].id;
                              String Id = noteinfo['Id'];
                              String type = noteinfo['type'];
                              String Duration = noteinfo['Duration'];
                              String price = noteinfo['Price'];
                              String Description = noteinfo['description'];
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Image.asset(
                                        "assets/images/bus.png",
                                        width: double.infinity),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(46),
                                          bottomLeft: Radius.circular(46)),
                                      color: Color(0xffFF4E00),
                                    ),
                                    child:Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(46),
                                            bottomLeft: Radius.circular(46)),
                                        color: Color(0xffFF4E00),
                                      ),
                                      child: ExpandablePanel(collapsed: SizedBox(height: 0,), expanded:
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2,left: 7,bottom: 10,right: 7),
                                        child: Text(Description,style: TextStyle(
                                              fontWeight:
                                              FontWeight.w400,
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                          header: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 0.0,top: 5),
                                                    child: Text(Duration,
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          color: Colors.white,
                                                          fontSize: 24),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 0.0),
                                                    child: Text(
                                                      "Rs: ${price}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Text(
                                                    'Type : ${type}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 0,),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  BuyTickets(
                                                                      price: snapshot.data!
                                                                          .docs[
                                                                      index])));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0),
                                                      child: Container(
                                                        height: 24,
                                                        width: 127,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                    28),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                    28)),
                                                            color:
                                                            Colors.white54),
                                                        child: Center(
                                                          child: Text(
                                                            "Buy Now",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                color:
                                                                Colors.black,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                            ],
                                          )
                                      ),
                                    ),

                                  ),
                                  SizedBox(height: 15,),
                                ],
                              );
                            },
                          ),
                        );
                      }else
                        return Column(
                          children: [
                            SizedBox(height: 100,),
                            Center(
                              child: CupertinoActivityIndicator(),
                            ),
                            SizedBox(height: 10,),
                            Text("Empty")
                          ],
                        );
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}