import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_ecommerce/ui/EditProfile2.dart';
import 'dart:io';

class EditProfile extends StatefulWidget
{
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController username = new TextEditingController();
  final TextEditingController emailCont = new TextEditingController();
  final TextEditingController mobilenumber = new TextEditingController();
  var namefocus = FocusNode();
  var emailfocus = FocusNode();
  var mobfocus = FocusNode();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  String currentpin = "";
  bool isRegisterd = false;
  final GlobalKey<State> loginloader = new GlobalKey<State>();

  var applogo = "";
  bool hasError = false,
      iscode = false,
      isdetail = false,
      isinterest = false,
      isloading = false;
  StreamController<ErrorAnimationType> errorController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark
      //or set color with: Color(0xFF0000FF)
    ));
    errorController = StreamController<ErrorAnimationType>.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        //   drawer: Container(child:new Drawer()),
        body: Container(
          width: SizeConfig.blockSizeHorizontal*100,
          height: SizeConfig.blockSizeVertical*100,
          decoration: new BoxDecoration(image: DecorationImage(image:
          AssetImage('assets/editprofile.png'),fit: BoxFit.fitWidth)),
          child: SingleChildScrollView(child: Container(child:
              Form(
                key: formKey,
                autovalidate: autoValidate,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2,
                            left: SizeConfig.blockSizeHorizontal*4),
                        child: Icon(Icons.sort,size:
                        SizeConfig.blockSizeVertical*5.5,color: Colors.white,),),
                      Container(
                        alignment: Alignment.centerRight,
                       margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2,
                           right: SizeConfig.blockSizeHorizontal*4),
                        child: Icon(Icons.notifications_on_outlined,size:
                      SizeConfig.blockSizeVertical*5.5,color: Colors.white,),),
                    ],
                  ),
                  InkWell(
                    onTap: ()
                    {

                    },
                    child:Container(
                      width: SizeConfig.blockSizeHorizontal * 33,
                      height: SizeConfig.blockSizeHorizontal * 33,
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,color: appmaincolor,

                        image: DecorationImage(image:
                         FileImage(File(""))),
                        ),
                      ),
                    ),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3.5),
                      width:SizeConfig.blockSizeHorizontal*70,
                      height: SizeConfig.blockSizeVertical*5,
                      child: Text("Change Profile Picture",style: GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5,color: Colors.white,
                          fontWeight: FontWeight.w500)))),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4.25),
                      width:SizeConfig.blockSizeHorizontal*90,
                      height: SizeConfig.blockSizeVertical*5,
                      child: Text("Username",style: GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5,color: Colors.white,
                          fontWeight: FontWeight.w500)))),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.5,
                        ),]
                    ),
                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.1,
                        left: SizeConfig.blockSizeHorizontal*5,right:
                        SizeConfig.blockSizeHorizontal*5),
                    child: TextFormField(
                      controller: username,
                      cursorColor:logincolor,
                      style: TextStyle(fontSize: 16.0 ),showCursor: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Password",hintStyle:
                      GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                          fontWeight: FontWeight.w400)),
                          border: InputBorder.none
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (s) {
                        if (s.trim().isEmpty) return "Username is required";
                        return null;
                      },
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(emailfocus),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                      width:SizeConfig.blockSizeHorizontal*90,
                      height: SizeConfig.blockSizeVertical*5,
                      child: Text("Email",style: GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5,color: Colors.white,
                          fontWeight: FontWeight.w500)))),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.5,
                        ),]
                    ),
                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.1,
                        left: SizeConfig.blockSizeHorizontal*5,right:
                        SizeConfig.blockSizeHorizontal*5),
                    child: TextFormField(
                      controller: emailCont,
                      cursorColor:logincolor,focusNode: emailfocus,
                      style: TextStyle(fontSize: 16.0 ),showCursor: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Email",hintStyle:
                      GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                          fontWeight: FontWeight.w400)),
                          border: InputBorder.none
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (s) {
                        if (s.trim().isEmpty) return "Email is required";
                        return null;
                      },
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(mobfocus),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                      width:SizeConfig.blockSizeHorizontal*90,
                      height: SizeConfig.blockSizeVertical*5,
                      child: Text("Mobile Number",style: GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5,color: Colors.white,
                          fontWeight: FontWeight.w500)))),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.5,
                        ),]
                    ),
                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.1,
                        left: SizeConfig.blockSizeHorizontal*5,right:
                        SizeConfig.blockSizeHorizontal*5),
                    child: TextFormField(
                      controller: mobilenumber,
                      cursorColor:logincolor,focusNode: mobfocus,
                      style: TextStyle(fontSize: 16.0 ),showCursor: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Mobile Number",hintStyle:
                      GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                          fontWeight: FontWeight.w400)),
                          border: InputBorder.none
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (s) {
                        if (s.trim().isEmpty) return "Mobile is required";
                        return null;
                      },
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).unfocus(),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                      width:SizeConfig.blockSizeHorizontal*100,
                      height: SizeConfig.blockSizeVertical*5,
                      child: Text("Reset Password",style: GoogleFonts.poppins(textStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.white,
                          fontWeight: FontWeight.w600)))),
                  InkWell(
                    onTap: ()
                    {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState.validate())
                      {
                        formKey.currentState.save();
                        Fluttertoast.showToast(msg: "Success!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile2()),
                        );
                      } else {
                        autoValidate = true;
                      }
                      setState(() {});
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: SizeConfig.blockSizeHorizontal*22.5,
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3,bottom: SizeConfig.blockSizeVertical*5),
                        padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.4,
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),
                        ),
                            color: appredcolor,boxShadow: [BoxShadow(
                              color: Colors.grey[800],
                              spreadRadius: 2.0,
                              offset: Offset.fromDirection(1,1),
                              blurRadius: 2.0
                            )]
                        ),
                        child:Text("Save",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                        SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),)),
                  )
                ],),
              )
         ),),),
      ),
    );
  }
}