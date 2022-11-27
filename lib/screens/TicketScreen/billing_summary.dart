import 'package:flutter/material.dart';
class BillingSummary extends StatelessWidget {
  var price;
  BillingSummary({Key? key,required this.price}) : super(key: key);

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
        title: Text("Billing Summary",style: TextStyle(
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
              Card(
                child: ListTile(
                  title: Text("SubTotal",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black
                  ),),
                  trailing: Text(price['Price'],style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black
                  ),),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Discount",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black
                  ),),
                  trailing: Text("-20 Sr",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black
                  ),),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Tax",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black
                  ),),
                  trailing: Text("81 Sr",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
