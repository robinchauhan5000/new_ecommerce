import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/data/repo/UpdatePassword.dart';
import 'package:flutter_ecommerce/utils/CommonUtils.dart';

class ResetPassword extends StatefulWidget
{
  String come;
  String mobnum;
  ResetPassword(this.come,{this.mobnum});
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController passwordcont = new TextEditingController();
  final TextEditingController cpasscont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  String currentpin = "";
  bool isRegisterd = false;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  var applogo = "";
  var updatepassword = new UpdatePasswordRepo();
  GetLoginUserEntity entity = new GetLoginUserEntity();
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
    if(widget.come!="Forgot") {
      SharedPreferencesTest().saveuserdata("get").then((value) {
        setState(() {
          Map userupdateddata = json.decode(value);
          entity = GetLoginUserEntity.fromJson(userupdateddata);
        });
      });
    }
    errorController = StreamController<ErrorAnimationType>.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
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
                            width: SizeConfig.blockSizeHorizontal*4,
                            height: SizeConfig.blockSizeVertical*8.5,
                            decoration: BoxDecoration(image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                AssetImage('assets/reset_upper.png'))),),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                     //       margin: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal*2),
                            width: SizeConfig.blockSizeHorizontal*28,
                            height: SizeConfig.blockSizeVertical*3.25,
                            decoration: BoxDecoration(image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/reset_left.png'))),),
                          Container(
                         //   margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical*0.5),
                            alignment: Alignment.bottomCenter,
                            width: SizeConfig.blockSizeHorizontal*25,
                            height: SizeConfig.blockSizeVertical*15,
                            decoration: BoxDecoration(image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                AssetImage('assets/reset_right.png'))),),

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
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*8.5,
                                left: SizeConfig.blockSizeHorizontal*8),
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*6.75,
                            child: Image.asset("assets/applogo.png"),),

                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*7),
                              // width:SizeConfig.blockSizeHorizontal*70,
                              height: SizeConfig.blockSizeVertical*7,
                              child: Text("Reset Password",style: GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*3.65,color: Colors.black,
                                  fontWeight: FontWeight.w500)))),

                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.5,
                                ),]
                            ),
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*11,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: passwordcont,
                              cursorColor:logincolor,
                              style: TextStyle(fontSize: 16.0 ),showCursor: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "New Password",hintStyle:
                              GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                                  fontWeight: FontWeight.w400)),
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (s) {
                                if (passwordcont.text.trim().isEmpty) return "Password is required";
                                if (passwordcont.text.trim().length<8) return "Password should be atleast 8 digits";
                                if (cpasscont.text.trim().toString()!=passwordcont.text.trim().toString()) return "Passwords should be same";
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
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6,
                                left: SizeConfig.blockSizeHorizontal*8,right:
                                SizeConfig.blockSizeHorizontal*8),
                            child: TextFormField(
                              controller: cpasscont,
                              cursorColor:logincolor,
                              style: TextStyle(fontSize: 16.0 ),showCursor: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Confirm Password",hintStyle:
                              GoogleFonts.poppins(textStyle:
                              TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.black38,
                                  fontWeight: FontWeight.w400)),
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (s) {
                                if (s.trim().isEmpty) return "Confirm Password is required";
                                if (cpasscont.text.trim().toString()!=passwordcont.text.trim().toString())
                                  {
                                    return "Passwords should be same";
                                  }
                                return null;
                              },
                              onFieldSubmitted: (s) =>
                                  FocusScope.of(context).requestFocus(passFocus),
                              textInputAction: TextInputAction.done,
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
                                if(widget.come!="Forgot")
                                  {
                                    updatepassword.updatePassword(passwordcont.text.trim(), context, entity.docs.elementAt(0).userMobile).then((value) {
                                      setState(()
                                      {
                                        isloading = false;
                                      });
                                      if(value.status==1)
                                      {
                                        showAlertDialog(context,value.message,"Reset");
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
                                  }
                               else
                                 {
                                   updatepassword.updatePassword(passwordcont.text.trim(), context, widget.mobnum).then((value) {
                                     setState(()
                                     {
                                       isloading = false;
                                     });
                                     if(value.status==1)
                                     {
                                       showAlertDialog(context,value.message,"ResetPassword");
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
                                 }
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
                                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*7
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
                                      Text("Submit",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                      SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),),
                                      Icon(Icons.arrow_forward_ios,color: Colors.white,size: SizeConfig.blockSizeVertical*2.75,)


                                    ],
                                  )),
                            ),
                          ),


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
              valueColor: new AlwaysStoppedAnimation<Color>(appColorPrimary),
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
      Stack(children: widgetList);
  }
}