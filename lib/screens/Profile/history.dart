import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/screens/Profile/profile.dart';
class TicketHistory extends StatefulWidget {
  const TicketHistory({Key? key}) : super(key: key);

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
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
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(width: 20,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                      },

                      child: Icon(Icons.arrow_back_ios)),
                  SizedBox(width: 50,),
                  Text(
                    "Tickets History",
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => AddTickets()));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 60, right: 60),
              //     child: Container(
              //       height: 45,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           border: Border.all(
              //             color: Color(0xff77E77B),
              //           ),
              //           borderRadius: BorderRadius.circular(40)),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "Add Tickets",
              //             style: GoogleFonts.poppins(
              //                 fontSize: 18,
              //                 color: Color(0xff77E77B),
              //                 fontWeight: FontWeight.w600),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Text(
                    "Tickets Purchased",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser
                      !.uid).collection('orders').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Image.asset("assets/images/bus.png",
                                          width: double.infinity),
                                    ),
                                    Container(
                                      height: 80,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(46),
                                            bottomLeft: Radius.circular(46)),
                                        color: Color(0xffFF4E00),
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(left: 12.0),
                                                child: Text(
                                                  snapshot.data!
                                                      .docs[index]['Duration'],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white,
                                                      fontSize: 24),
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        left: 15.0),
                                                    child: Text(
                                                      "Rs: ${snapshot.data!
                                                          .docs[index]['order']}",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .w400,
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 140,
                                                  ),
                                                  Text(
                                                    snapshot.data!
                                                        .docs[index]['type'],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              // InkWell(
                                              //   //   onTap: (){
                                              //   //     Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyTickets()));
                                              //   //   },
                                              //   child: Padding(
                                              //     padding: const EdgeInsets.only(left: 14.0),
                                              //     child: Container(
                                              //       height: 24,
                                              //       width: 127,
                                              //       decoration: BoxDecoration(
                                              //           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28),bottomRight: Radius.circular(28)),
                                              //           color: Colors.white54
                                              //       ),
                                              //       child: Center(
                                              //         child: Text("Buy Now",style: TextStyle(
                                              //             fontWeight: FontWeight.w500,color: Colors.black,fontSize: 16
                                              //         ),),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),

                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 12.0),
                                          //   child: Container(
                                          //     height: 70,
                                          //     width: 70,
                                          //     decoration: BoxDecoration(
                                          //         shape: BoxShape.circle,
                                          //         color: Colors.white54
                                          //     ),
                                          //     child: Center(child: Icon(Icons.keyboard_arrow_down_rounded,size: 60,color: Colors.white,)),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                );
                              }
                          );
                        }else
                          return CupertinoActivityIndicator();
                      }
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
