import 'package:flutter/material.dart';
import 'package:metro_guide/screens/book_tickets/maps.dart';

import '../screens/Maps/riyadh.dart';
import '../screens/Profile/profile.dart';
import '../screens/TicketScreen/tickets_screen.dart';
import '../screens/book_tickets/g_maps.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> allPages= [
    Riyadh(),
    TicketsScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:allPages[currentIndex!],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        currentIndex: currentIndex!,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on,size: 24,),
              label: "Map"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel,size: 24,),
              label: "Tickets"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded,size: 24,),
              label: "Profile"
          ),
        ],
        selectedItemColor: Color(0xff77E77B),
        unselectedItemColor: Color(0xffBBBBBB),
      ),

    );
  }
  int? currentIndex = 1;
}
