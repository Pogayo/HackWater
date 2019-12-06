import 'package:flutter/material.dart';
import 'plumber.dart';


Widget showLogo(){
  return Container(
    child: Text("Please let us know of a leakage in your proximity below", style: TextStyle(
      fontWeight: FontWeight.bold, fontSize:16
    )),
  );
}

class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  _ReportState createState() => _ReportState();

}

class _ReportState extends State<Report>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, fontStyle: FontStyle.italic);
  EdgeInsets content_padding=EdgeInsets.fromLTRB(16.0, 13.0, 16.0, 13.0);


  final _formKey = GlobalKey<FormState>();

  String _description = "";
  String _location = "";
  String _title="";
  bool _isLoading=false;
  String _picture;
  String _errorMessage;
  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
//      try {
//
//        setState(() {
//          _isLoading = false;
//        });
//
//        }
//      } catch (e) {
//        print('Error: $e');
//        setState(() {
//          _isLoading = false;
//          _errorMessage = e.message;
//          _formKey.currentState.reset();
//        });
//      }
    }
  }

  @override
  void initState() {
    _location = "";
    _isLoading = false;
    _description="";
    _picture="";
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff8731DC),)));
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
  Widget showErrorMessage() {
    return Container();
//    if (_errorMessage.length > 0 && _errorMessage != null) {
//      return new Text(
//        _errorMessage,
//        style: TextStyle(
//            fontSize: 13.0,
//            color: Colors.red,
//            height: 1.0,
//            fontWeight: FontWeight.w300),
//      );
//    } else {
//      return new Container(
//        height: 0.0,
//      );
//    }
  }

  @override
  Widget build(BuildContext context) {

    final locationField =TextFormField(
      onSaved: (value) => _location = value.trim(),
      validator: (value) => value.isEmpty ? 'Empty search ' : null,
      style: style,

      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: content_padding,
          hintText: "Location",
          prefixIcon: new Icon(
            Icons.search,
            color:  Colors.blue,),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
    final titleField =TextFormField(
      onSaved: (value) => _title = value.trim(),
      validator: (value) => value.isEmpty ? 'Empty title ' : null,
      style: style,

      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: content_padding,
          hintText: "Title",
          prefixIcon: new Icon(
            Icons.title,
            color:  Colors.blue,),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );


    final descriptionField = TextFormField(
      onSaved: (value) => _description= value.trim(),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      style: style,
      minLines: 4,
      maxLines: 8,
      decoration: InputDecoration(
          contentPadding:content_padding,
          hintText: "Describe the incident in the format below: \n"
              "Flow:eg Very fast, medium, slow\n"
              "Approx  start time: eg 10:30 pm\n",
          prefixIcon: new Icon(
            Icons.dehaze,
            color:  Colors.blue,),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
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
              showLogo(),
              SizedBox(height: 20.0),
              titleField,
              SizedBox(height: 14.0),
              locationField,
              SizedBox(height: 14.0),
              descriptionField,
              SizedBox(height: 14.0,),
              takeApicture(),
              SizedBox(height: 14.0,),
              showPrimaryButton(),
              SizedBox(height: 14.0,),
              showErrorMessage(),
            ],
          ),
        ),
      ),
    );


    return Scaffold(

        body: Stack(
          children: <Widget>[
            showForm,
            showCircularProgress(),
          ],
        )
    );
  }

  Widget showPrimaryButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(24.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: content_padding,
        onPressed:validateAndSubmit ,
        child: Text("Submit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

  }

  Widget takeApicture() {
    return new FlatButton(
        color:Colors.lightGreen,
        child: new Text(
            'Take a picture',
            style:  style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)),
        onPressed: ()=> print("Pictue taken"));
  }
}
