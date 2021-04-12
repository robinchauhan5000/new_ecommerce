import 'dart:async';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_ecommerce/utils/CommonUtils.dart';

import 'package:flutter_ecommerce/data/repo/SignUpUser.dart';
import 'package:flutter_ecommerce/ui/OTPSscreen.dart';
import 'package:flutter_ecommerce/utils/SocialLoginMethods.dart';
import 'package:flutter_ecommerce/data/repo/FbLogin.dart';
import 'package:flutter_ecommerce/data/repo/GoogleLoginRepo.dart';
import 'dart:io';

class RegisterScreen extends StatefulWidget
{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController username = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController emailCont = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController cpassword = new TextEditingController();
  final TextEditingController zipcode = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  CountryCode country;
  String countrycode;
  bool obscureText = true;
  bool autoValidate = false;
  String currentpin = "";
  var passCont = TextEditingController();
  bool isRegisterd = false;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var usernamefocus = FocusNode();
  var emailFocus = FocusNode();
  var mobFocus = FocusNode();
  var passFocus = FocusNode();
  var cpassFocus = FocusNode();
  var zipFocus = FocusNode();
  var registerrepo = new SignUpUserRepo();

  var applogo = "";
  bool hasError = false,
      iscode = false,
      isdetail = false,
      isinterest = false,
      isloading = false;
  StreamController<ErrorAnimationType> errorController;
  var signUpUserRepo = SignUpUserRepo();
  var fbrepo = FbUserRepo();
  var googlerepo = GoogleUserRepo();
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
    List<Widget> widgetList = new List<Widget>();
    var child =  SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        //   drawer: Container(child:new Drawer()),
        body: Container(
          color: appmaincolor,
          width: SizeConfig.blockSizeHorizontal*100,
          height: SizeConfig.blockSizeVertical*100,
          child:Container(child:
          Form(
            key: formKey,
            autovalidate: autoValidate,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical*100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal*30,
                            height: SizeConfig.blockSizeVertical*20,
                            decoration: BoxDecoration(image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                AssetImage('assets/register_upper_left.png'))),),
                          Container(
                            alignment: Alignment.topCenter,
                            width: SizeConfig.blockSizeHorizontal*7,
                            height: SizeConfig.blockSizeVertical*6.5,
                            decoration: BoxDecoration(image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                AssetImage('assets/register_upper_right.png'))),),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal*2),
                            width: SizeConfig.blockSizeHorizontal*22,
                            height: SizeConfig.blockSizeVertical*16,
                            decoration: BoxDecoration(image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/register_bottom_right.png'))),),
                          Container(
                            margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical*0.5),
                            alignment: Alignment.bottomCenter,
                            width: SizeConfig.blockSizeHorizontal*24,
                            height: SizeConfig.blockSizeVertical*26,
                            decoration: BoxDecoration(image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                AssetImage('assets/bottom_left.png'))),),

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical*3),
                  child: SingleChildScrollView(
                    child: Container(

                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6,left: SizeConfig.blockSizeHorizontal*8),
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*6.75,
                            child: Image.asset("assets/applogo.png"),),

                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4),
                              // width:SizeConfig.blockSizeHorizontal*70,
                              height: SizeConfig.blockSizeVertical*7,
                              child: Text("REGISTER",style: GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*3.65,color: Colors.black,
                                  fontWeight: FontWeight.w500)))),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: ()
                                {
                                  fbLogin(context: context);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.blockSizeHorizontal*34,
                                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3),
                                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.4,
                                    ),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),
                                    ),
                                        color: appmainthemecolor
                                    ),
                                    child:Text("Facebook",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                    SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight:
                                    FontWeight.w600)),)),
                              ),
                              InkWell(
                                onTap: ()
                                {
                                  googleLogin(context:context);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.blockSizeHorizontal*34,
                                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3),
                                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.4,
                                    ),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),
                                    ),
                                        color: appredcolor
                                    ),
                                    child:Text("Google",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                    SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),)),
                              )
                            ],),

                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: username,
                              cursorColor:logincolor,focusNode: usernamefocus,
                              style: TextStyle(fontSize: 16.0 ),showCursor: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Username",hintStyle:
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
                                  FocusScope.of(context).requestFocus(emailFocus),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: emailCont,
                              cursorColor:logincolor,focusNode: emailFocus,
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
                                  FocusScope.of(context).requestFocus(mobFocus),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: mobile,
                              focusNode: mobFocus,
                              cursorColor:logincolor,
                              style: TextStyle(fontSize: 16.0 ),showCursor: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Mobile",hintStyle:
                              GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                                  fontWeight: FontWeight.w400)),
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.number,
                              validator: (s) {
                                if (s.trim().isEmpty) return "Mobile is required";
                                return null;
                              },
                              onFieldSubmitted: (s) =>
                                  FocusScope.of(context).requestFocus(passFocus),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: password,focusNode: passFocus,
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
                                if (s.trim().isEmpty) return "Password is required";
                                return null;
                              },
                              onFieldSubmitted: (s) =>
                                  FocusScope.of(context).requestFocus(cpassFocus),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: cpassword,focusNode: cpassFocus,
                              cursorColor:logincolor,
                              style: TextStyle(fontSize: 16.0 ),showCursor: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Confirm Passowrd",hintStyle:
                              GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                                  fontWeight: FontWeight.w400)),
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (s) {
                                if (s.trim().isEmpty) return "Confirm Password is required";
                                return null;
                              },
                              onFieldSubmitted: (s) =>
                                  FocusScope.of(context).requestFocus(zipFocus),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal*90,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: /*TextFormField(
                              controller: emailCont,
                              cursorColor:logincolor,
                              style: TextStyle(fontSize: 16.0 ),showCursor: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Country",hintStyle:
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
                                  FocusScope.of(context).requestFocus(passFocus),
                              textInputAction: TextInputAction.next,
                            ),*/
                            CountryCodePicker(
                              onChanged: _onCountryChange,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'US',showFlagMain: true,
                              // optional. Shows only country name and flag
                              showCountryOnly: false,hideMainText: false,
                              padding: EdgeInsets.only(right: 4.0),
                              textStyle: GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                              showFlag: true,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: true,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: zipcode,focusNode: zipFocus,
                              cursorColor:logincolor,
                              style: TextStyle(fontSize: 16.0 ),showCursor: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Zip Code",hintStyle:
                              GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                                  fontWeight: FontWeight.w400)),
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (s) {
                                if (s.trim().isEmpty) return "Zipcode is required";
                                return null;
                              },
                              onFieldSubmitted: (s) =>
                                  FocusScope.of(context).requestFocus(passFocus),
                              textInputAction: TextInputAction.next,
                            ),
                          ),


                          InkWell(
                            onTap: ()
                            {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState.validate())
                              {
                                formKey.currentState.save();
                                setState(() {
                                  isloading = true;
                                });
                                registerrepo.signUpUser(context, emailCont.text.trim().toString(),
                                    username.text.trim().toString(),
                                    password.text.trim().toString(),
                                    countrycode.toString()+mobile.text.trim().toString(),
                                    zipcode.text.trim().toString(),
                                    "India", "manual").then((value) {
                                    setState(() {
                                      isloading = false;
                                    });
                                    if(value.status==1)
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => OTPScreen(countrycode.toString()+mobile.text.trim().toString())),
                                        );
                                      }
                                    else
                                      {
                                        showAlertDialog(context,value.message,"");
                                      }
                                }).catchError((onError){
                                  setState(() {
                                    isloading = false;
                                  });
                                });
                              } else {
                                autoValidate = true;
                              }
                              setState(() {});
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  alignment: Alignment.center,
                                  width: SizeConfig.blockSizeHorizontal*31,
                                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*5.5
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
                                      Text("Register",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                      SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),),
                                      Icon(Icons.arrow_forward_ios,color: Colors.white,size: SizeConfig.blockSizeVertical*2.75,)


                                    ],
                                  )),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*5,bottom: SizeConfig.blockSizeVertical*5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(child:  Text("New Here ? ",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                SizeConfig.blockSizeVertical*2.15,color: Colors.black,fontWeight:
                                FontWeight.w500)),)),
                                InkWell(
                                  onTap: ()
                                  {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(child:  Text("Login",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                  SizeConfig.blockSizeVertical*2.15,color:appredcolor ,fontWeight: FontWeight.w500)),)),
                                )


                              ],),)
                        ],
                      ),
                    ),
                  ),
                ),



              ],
            ),
          ),),),),
    );

    widgetList.add(child);
    if (isloading) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Colors.pink),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }

    return
      /* WillPopScope(
            onWillPop: ,
            child:*/
      Stack(
          children: widgetList
      );
      
  }

  void _onCountryChange(CountryCode countryCodeq)
  {
    setState(() {
      country = countryCodeq;
      countrycode = country.dialCode;
    });
  }
  Future fbLogin({BuildContext context}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SocialLogin().fbLogin(context: context).then((value) async {
          // Dialogs.showLoadingDialog(context, loginloader);
          if (value != null &&
              value != "" &&
              value.profile['email'] != null &&
              value.profile['email'] != "") {
            setState(() {
              isloading = true;
            });
            fbrepo.loginUser(value.profile['email'], value.profile['image'], context).then((value) {
              setState(() {
                isloading = false;
              });
              if(value.status==1)
              {
                showAlertDialog(context,value.message,"");
              }
              else
              {
                showAlertDialog(context,value.message,"");
              }
            }).catchError((error){
              setState(() {
                isloading = false;
              });
            });

          } else {
            //  Navigator.of(loginloader.currentContext, rootNavigator: true).pop();
            showAlertDialog(context,"No Data", "Login");
          }
        });
      }
    } on SocketException catch (_) {

    }
  }

  Future googleLogin({
    BuildContext context,
  }) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SocialLogin().googleLogin().then((value) async {
          if (value != null &&
              value != "" &&
              value.googleProfile.email != null &&
              value.googleProfile.email != "") {
            //  SharedPreferenceData().saveGoogleDetails(data: value.googleProfile);
            setState(() {
              isloading = true;
            });
            googlerepo.googlelogin(value.googleProfile.email, value.googleProfile.photoUrl, context).then((value) {
              setState(() {
                isloading = false;
              });
              if(value.status==1)
              {
                showAlertDialog(context,value.message,"");
              }
              else
              {
                showAlertDialog(context,value.message,"");
              }
            }).catchError((error){
              setState(() {
                isloading = false;
              });
            });

          } else {
            Navigator.of(loginloader.currentContext, rootNavigator: true).pop();
            showAlertDialog(context, "No Data", "Login");
          }
        });
      }
    } on SocketException catch (_) {

    }
  }
}