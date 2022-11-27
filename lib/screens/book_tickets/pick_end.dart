import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:metro_guide/screens/book_tickets/route.dart';
import 'package:metro_guide/screens/book_tickets/route_end.dart';
class PickEnd extends StatefulWidget {
  const PickEnd({Key? key}) : super(key: key);

  @override
  State<PickEnd> createState() => _PickEndState();
}

class _PickEndState extends State<PickEnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,size: 25,)),
                  SizedBox(width: 80),
                  Text(
                    "Stations",
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 25,),
                  Text("Pick a Ending Point",style:GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black), )
                ],
              ),
              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffFFFFFF),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(-4, -4)),
                        BoxShadow(
                            color: Color(0xff587CA7).withOpacity(0.31),
                            blurRadius: 22,
                            spreadRadius: 0,
                            offset: Offset(
                              6,
                              6,
                            )),
                      ],
                      border: Border.all(color: Color(0xff77E77B),width: 2)
                  ),
                  child: SingleChildScrollView(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('stations')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return CupertinoActivityIndicator();
                          return DataTable(
                              showBottomBorder: false,
                              headingRowHeight: 60,
                              horizontalMargin: 20,
                              columnSpacing: 120,
                              columns: [
                                DataColumn(
                                    label: Text(
                                      "Actions",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red.shade400),
                                    )),
                                DataColumn(
                                    label: Text(
                                      "Stations",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red.shade400),
                                    )),
                              ],
                              rows: _buildList(context, snapshot.data!.docs)
                          );
                        }),
                  ),
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}
List<DataRow> _buildList(
    BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((data) => _buildListItem(context, data)).toList();
}

DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
  // final Users = users.fromSnapshot(data);
  return DataRow(
      cells: [
        DataCell(GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RouteEnd(to:data)));
          },
          child: Text(
            "To :",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        )
        ),
        DataCell(Padding(
          padding: const EdgeInsets.only(left: 0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RouteEnd(to:data)));
            },
            child: Text(
              data["Station name"],
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500),    ),
          ),
        )),
      ]);
}
