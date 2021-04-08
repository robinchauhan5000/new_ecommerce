import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/ui/MainLists.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:io';


class EditProfile2 extends StatefulWidget {
  @override
  _EditProfile2State createState() => _EditProfile2State();
}

class _EditProfile2State extends State<EditProfile2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController address = new TextEditingController();
  final TextEditingController state = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController zipCode = new TextEditingController();
  var addressFocus = FocusNode();
  var stateFocus = FocusNode();
  var countryFocus = FocusNode();
  var zipFocus = FocusNode();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  String currentpin = "";
  bool isRegisterd = false;

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
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(image:
                  AssetImage('assets/editprofiletile.png'),fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.sort,
                            color: Colors.white,
                          size: SizeConfig.blockSizeHorizontal * 10,),
                          Icon(Icons.notifications_active_outlined,
                            color: Colors.white,
                            size: SizeConfig.blockSizeHorizontal * 10,)
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
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
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                            alignment: Alignment.center,
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*3,
                            child: Text("User Name",
                                style: GoogleFonts.poppins(textStyle:
                            TextStyle(fontSize: SizeConfig.blockSizeVertical*2.25,color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                        Container(
                          margin:EdgeInsets.only(top: SizeConfig.screenHeight * 0.005,
                          bottom:  SizeConfig.screenHeight * 0.005),
                            alignment: Alignment.center,
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*3,
                            child: Text("username@mail.com",
                                style: GoogleFonts.poppins(textStyle:
                            TextStyle(fontSize: SizeConfig.blockSizeVertical*1.5,color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                        Container(
                            alignment: Alignment.center,
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*3,
                            child: Text("8798546521320",style: GoogleFonts.poppins(textStyle:
                            TextStyle(fontSize: SizeConfig.blockSizeVertical*1.5,color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainListPage()),
                            );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: SizeConfig.blockSizeHorizontal*22.5,
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical*0.1,
                                  bottom: SizeConfig.blockSizeVertical*0.1),
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.4,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/edit button.png'),
                                )
                              ),
                              child:Text("Edit",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                              SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),)),
                        ),
                      ],),],)),
              
              Container(
                margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2.25),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(child: Text("Address",style: TextStyle(color: Colors.black),),
                       ),
                      Container(
                        height: SizeConfig.screenHeight * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/tile.png'),
                            fit: BoxFit.fitWidth
                          )
                        ),
                        child: TextFormField(
                          focusNode: addressFocus,
                          controller: address,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 8,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                          onFieldSubmitted: (term){
                            addressFocus.unfocus();
                            FocusScope.of(context).requestFocus(stateFocus);
                          },
                          validator: (value){
                            if(value.isEmpty)
                              return "This field is required";
                            else
                              return null;
                          },
                        ),
                      ),
                      Container(child: Text("State",style: TextStyle(color: Colors.black),),
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.08,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/tile2.png'),
                                fit: BoxFit.fitWidth
                            )
                        ),
                        child: TextFormField(
                          focusNode: stateFocus,
                          controller: state,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none
                          ),
                          onFieldSubmitted: (term){
                            stateFocus.unfocus();
                            FocusScope.of(context).requestFocus(countryFocus);
                          },
                          validator: (value){
                            if(value.isEmpty)
                              return "This field is required";
                            else
                              return null;
                          },
                        ),
                      ),
                      Container(child: Text("Country",style: TextStyle(color: Colors.black),),
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.08,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/tile2.png'),
                                fit: BoxFit.fitWidth
                            )
                        ),
                        child: TextFormField(
                          focusNode: countryFocus,
                          controller: country,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 8,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none
                          ),
                          onFieldSubmitted: (term){
                            countryFocus.unfocus();
                            FocusScope.of(context).requestFocus(zipFocus);
                          },
                          validator: (value){
                            if(value.isEmpty)
                              return "This field is required";
                            else
                              return null;
                          },
                        ),
                      ),
                      Container(child: Text("Zipcode",style: TextStyle(color: Colors.black),),
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.08,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/tile2.png'),
                                fit: BoxFit.fitWidth
                            )
                        ),
                        child: TextFormField(
                          focusNode: zipFocus,
                          controller: zipCode,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          maxLines: 8,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none
                          ),
                          onFieldSubmitted: (term){
                            zipFocus.unfocus();
                          },
                          validator: (value){
                            if(value.isEmpty)
                              return "This field is required";
                            else
                              return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            alignment: Alignment.center,
                            width: SizeConfig.blockSizeHorizontal*22.5,
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical*0.1,
                                bottom: SizeConfig.blockSizeVertical*0.1),
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.4,
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/save button.png'),
                                )
                            ),
                            child:Text("Save",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                            SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),)),
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
        ),
        ),
      );
  }
}
