import 'package:flutter/material.dart';
import 'plumber.dart';




class BookPlumber extends StatefulWidget {
  BookPlumber({Key key}) : super(key: key);

  _BookPlumberState createState() => _BookPlumberState();

}

class _BookPlumberState extends State<BookPlumber>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0, fontStyle: FontStyle.italic);
  List<Widget> plumbers = [];
  String _searchKey="";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    for (int i=0;i<5;i++){
      plumbers.add(new Plumber());
    }

    final searchField = TextFormField(
      onSaved: (value) => _searchKey = value.trim(),
      validator: (value) => value.isEmpty ? 'Empty search ' : null,
      style: style,
      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Search..",
          prefixIcon: new Icon(
            Icons.search,
            color:  Colors.blue,),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
    );

    final showForm=Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              searchField,

            ],
          ),
        ),
      ),
    );

    plumbers.insert(0, showForm);

    return Scaffold(
        appBar: AppBar(title:Text("LiquiDot")
        ),
        body: Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.0)
           ),
            padding: EdgeInsets.fromLTRB(10,0,12,10),
            child:ListView(
                children: plumbers
            )
        )


    );
  }
}


