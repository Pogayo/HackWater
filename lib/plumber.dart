import 'package:flutter/material.dart';




class Plumber extends StatelessWidget{
 final TextStyle locationStyle=TextStyle(color: Color(0xffffce44));
 final TextStyle priceStyle=TextStyle(color: Color(0xff1aa260));
 final TextStyle  numberStyle=TextStyle(fontStyle: FontStyle.italic, color:Colors.black);


 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child:ListTile(
          leading: Icon(Icons.person, color: Color(0xff120023)),
          title: Text("Perez Ogayo",style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle:RichText(
              text:TextSpan(
                children:<TextSpan>[
                  TextSpan(
                      text:"Kacyiru, Kigali \n" ,
                      style:locationStyle),
                  TextSpan(
                      text:"2000Rwf/hr \n" ,
                      style:priceStyle),
                  TextSpan(
                      text:"+250785774412\n",
                      style:numberStyle),

              ]),
                ),
            onTap:()=>print("Hello there"),
        )



    );
  }
}

