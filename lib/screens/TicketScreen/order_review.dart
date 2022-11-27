import 'package:flutter/material.dart';

class OrderReview extends StatelessWidget {
  const OrderReview({Key? key}) : super(key: key);

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
        title: Text("Order Review",style: TextStyle(
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
              Text("3 Items In Card",style: TextStyle(
                fontSize: 24,fontWeight: FontWeight.w500,color: Colors.black
              ),),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/container.png",height: 100,),
                  Column(
                    children: [
                      Text("1 Year Tickets",style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black
                      ),),
                      Image.asset("assets/images/cont.png",width: 140,),
                    ],
                  ),
                  Text("560 SR",style: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black
                  ),),
                ],
              ),
              SizedBox(height: 20,),
              Divider(thickness: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
