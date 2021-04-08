import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_ecommerce/data/repo/ResendOtp.dart';


class ForgotPassword extends StatefulWidget
{
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  String currentpin = "";
  var passCont = TextEditingController();
  bool isRegisterd = false;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  var applogo = "";
  bool hasError = false,
      iscode = false,
      isdetail = false,
      isinterest = false,
      isloading = false;
  StreamController<ErrorAnimationType> errorController;
  var forgotPasswordRepo = ForgotPasswordRepo();

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
          color: appmaincolor,
          width: SizeConfig.blockSizeHorizontal*100,
          height: SizeConfig.blockSizeVertical*100,
          child: SingleChildScrollView(child: Container(child:
          Form(
            key: formKey,
            autovalidate: true,
            child: Stack(
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical*100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal*100,
                        height: SizeConfig.blockSizeVertical*32,
                        decoration: BoxDecoration(image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                            AssetImage('assets/login_upper.png'))),),
                      Container(
                        width: SizeConfig.blockSizeHorizontal*100,
                        height: SizeConfig.blockSizeVertical*15,
                        decoration: BoxDecoration(image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                            AssetImage('assets/login_shape.png'))),)
                    ],),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal*100,
                  height: SizeConfig.blockSizeVertical*100,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6),
                      width:SizeConfig.blockSizeHorizontal*70,
                      height: SizeConfig.blockSizeVertical*7,
                      child: Image.asset("assets/applogo.png"),),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4),
                       // width:SizeConfig.blockSizeHorizontal*70,
                        height: SizeConfig.blockSizeVertical*7,
                        child: Text("Forgot Password",style: GoogleFonts.poppins(textStyle:
                        TextStyle(fontSize: SizeConfig.blockSizeVertical*3.65,color: Colors.white,
                            fontWeight: FontWeight.w500)))),

                  ],),),

                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.5,
                          ),]
                      ),
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*42,
                          left: SizeConfig.blockSizeHorizontal*8,right:
                          SizeConfig.blockSizeHorizontal*8),
                      child: TextFormField(
                        controller: emailCont,
                        cursorColor:logincolor,
                        style: TextStyle(fontSize: 16.0 ),showCursor: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Mobile No.",hintStyle:
                        GoogleFonts.poppins(textStyle:
                        TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                            fontWeight: FontWeight.w400)),
                            border: InputBorder.none
                        ),
                        keyboardType: TextInputType.number,
                        validator: (s) {
                          if (s.trim().isEmpty) return "Number is required";
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                    ),


                    Container(
                        alignment: Alignment.centerLeft,
                        // width:SizeConfig.blockSizeHorizontal*70,
                        margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*8,
                            top: SizeConfig.blockSizeVertical*2.25),
                        child: Text("Enter OTP",style: GoogleFonts.poppins(textStyle:
                        TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black54,
                            fontWeight: FontWeight.w500)))),
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical *4),
                      child: PinCodeTextField(
                        appContext: context,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        pastedTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.blockSizeVertical * 2.5),
                        length: 6,
                        obscureText: false, enablePinAutofill: true,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        backgroundColor: appmaincolor,
                        validator: (v) {
                          if (currentpin.length < 6) {
                            errorController.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                              hasError = true;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10.0),
                            fieldHeight: SizeConfig.blockSizeVertical * 5.5,
                            fieldWidth: SizeConfig.blockSizeVertical * 5.5,
                            inactiveColor:
                            hasError ? Colors.red : Colors.white24,
                            selectedColor: Colors.white,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.black38,
                            activeColor: Colors.white,
                            borderWidth: 1.25),
                        cursorColor: Colors.white,
                        animationDuration: Duration(milliseconds: 300),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                        ),
                        enableActiveFill: true,boxShadows: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.75,
                        ),
                      ],
                        errorAnimationController: errorController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentpin = value;
                            if (currentpin.length >= 6)
                              hasError = false;
                            else
                              hasError = true;
                          });
                        },
                      ),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState.validate())
                        {
                          formKey.currentState.save();
                         /* setState(() {
                            if (currentpin.length < 6) {
                              errorController.add(ErrorAnimationType
                                  .shake); // Triggering error shake animation
                              setState(() {
                                hasError = true;
                              });
                            } else {
                              Fluttertoast.showToast(msg: "Success!");
                            }
                          });*/
                          Fluttertoast.showToast(msg: "Success!");

                        } else {
                          autoValidate = true;
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            alignment: Alignment.center,
                            width: SizeConfig.blockSizeHorizontal*31,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4
                                ,right: SizeConfig.blockSizeHorizontal*8),
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.25,
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),
                            ),
                                color: appredcolor,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.75,
                                ),]
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(width: SizeConfig.blockSizeHorizontal*2.75,),
                                InkWell(
                                  onTap: (){
                                    //todo : implement forgot pwd api
                                  },
                                  child: Text("Submit",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                  SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),),
                                ),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,size: SizeConfig.blockSizeVertical*2.75,)


                              ],
                            )),
                      ),
                    ),


                  ],
                ),



              ],
            ),
          ),),),),
      ),
    );
  }
}