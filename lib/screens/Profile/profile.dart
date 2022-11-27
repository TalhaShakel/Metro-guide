
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_guide/on_boarding/reset_password.dart';
import 'package:metro_guide/screens/Profile/reset_email.dart';
import 'package:metro_guide/screens/Profile/reset_name.dart';


import 'history.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff77E77B),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(45))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Hi!",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                snapshot.data!['username'],
                                style: GoogleFonts.poppins(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Profile",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ResetEmail(data:snapshot.data!)));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Reset Email',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey.shade800),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ResetName(data:snapshot.data!)));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Reset UserName',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey.shade800),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ResetPassword(data:snapshot.data!)));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Reset Password',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey.shade800),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Trips & Tickets",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketHistory()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Tickets History',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey.shade800),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Image.asset(
                          'assets/images/Vector.png',
                          height: 400,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Image.asset(
                              'assets/images/qr.png',
                              width: 260,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 290, left: 50),
                        child: Text(
                          "duration: 5 days left\npurches day: 13-oct-2022\nexpiry date: 20-oct-2022\nticket type: 1 week ticket",
                          style: GoogleFonts.poppins(fontSize: 14),),
                      )
                    ]),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            );
          }else{
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff77E77B),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(45))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Hi!",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'John Dee',
                                style: GoogleFonts.poppins(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Profile",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ResetEmail(data:snapshot.data!)));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Reset Email',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey.shade800),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ResetName(data:snapshot.data!)));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Reset UserName',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey.shade800),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ResetPassword(data:snapshot.data!)));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Reset Password',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey.shade800),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Trips & Tickets",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Tickets History',
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey.shade800),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.grey.shade800,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Image.asset(
                          'assets/images/Vector.png',
                          height: 400,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Image.asset(
                              'assets/images/qr.png',
                              width: 260,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 290, left: 50),
                        child: Text(
                          "duration: 5 days left\npurches day: 13-oct-2022\nexpiry date: 20-oct-2022\nticket type: 1 week ticket",
                          style: GoogleFonts.poppins(fontSize: 14),),
                      )
                    ]),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            );
          }
        }
      ),
    );
  }
}
