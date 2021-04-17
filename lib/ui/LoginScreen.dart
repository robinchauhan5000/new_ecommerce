import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/ui/EditProfile.dart';
import 'package:flutter_ecommerce/ui/EditProfile2.dart';
import 'package:flutter_ecommerce/ui/ForgotPassword.dart';
import 'package:flutter_ecommerce/ui/OTPSscreen.dart';
import 'package:flutter_ecommerce/ui/RegisterScreen.dart';
import 'package:flutter_ecommerce/ui/ResetPassword.dart';
import 'package:flutter_ecommerce/utils/Dialogs.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ecommerce/data/repo/LogInUser.dart';
import 'package:flutter_ecommerce/utils/CommonUtils.dart';
import 'dart:io';
import 'package:flutter_ecommerce/utils/SocialLoginMethods.dart';
import 'package:flutter_ecommerce/data/repo/FbLogin.dart';
import 'package:flutter_ecommerce/data/repo/GoogleLoginRepo.dart';
import 'package:flutter_ecommerce/ui/CheckoutScreen.dart';
import 'package:flutter_ecommerce/ui/ItemListGrid.dart';
import 'package:flutter_ecommerce/ui/MainLists.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'package:flutter_ecommerce/data/repo/GetLoginUser.dart';
import 'package:flutter_ecommerce/ui/ForgotPassword.dart';
import 'package:flutter_ecommerce/ui/MobileAuth.dart';
class LoginScreen extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = false;
  bool autoValidate = false;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  var isloading = false;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  var applogo = "";
  var userrepo = new GetLoginUser();
  var loginRepo = LoginUserRepo();
  var fbrepo = FbUserRepo();
  var googlerepo = GoogleUserRepo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child = SafeArea(
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
            autovalidate: autoValidate,
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
                      child: Image.asset('assets/editprofile.png'),),
                    InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile()),
                        );
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4),
                          width:SizeConfig.blockSizeHorizontal*70,
                          height: SizeConfig.blockSizeVertical*7,
                          child: Text("LOGIN",style: GoogleFonts.poppins(textStyle:
                          TextStyle(fontSize: SizeConfig.blockSizeVertical*4,color: Colors.white,
                              fontWeight: FontWeight.w500)))),
                    ),

                  ],),),

                Column(
                  children: [
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
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*36.5),
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.4,
                              ),
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),
                              ),
                                  color: appmainthemecolor
                              ),
                              child:Text("Facebook",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                              SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),)),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            googleLogin(context: context);
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: SizeConfig.blockSizeHorizontal*34,
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*36.5),
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
                        controller: emailCont,
                        cursorColor:logincolor,
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
                          if (s.trim().isEmpty) return "Username is required";
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
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4,
                          left: SizeConfig.blockSizeHorizontal*8,right:
                          SizeConfig.blockSizeHorizontal*8),
                      child: TextFormField(
                        controller: passCont,
                        cursorColor:logincolor,focusNode: passFocus,obscureText: obscureText,
                        style: TextStyle(fontSize: 16.0 ),showCursor: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8), suffixIcon: InkWell(
                            onTap: ()
                          {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                              child: Icon(!obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,color: Colors.black,),
                            ),
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
                            FocusScope.of(context).unfocus(),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                      },
                      child: Container(
                          alignment: Alignment.centerLeft,
                          width: SizeConfig.blockSizeHorizontal*84,
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*2.25,),
                          child:Text("Forgot Password ?",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                          SizeConfig.blockSizeVertical*2.1,color: Colors.black,fontWeight: FontWeight.w400)),)),
                    ),

                    InkWell(
                      onTap: ()
                      {


                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            alignment: Alignment.center,
                            width: SizeConfig.blockSizeHorizontal*31,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5
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
                                    FocusScope.of(context).unfocus();
                                    if (formKey.currentState.validate())
                                    {
                                      formKey.currentState.save();
                                      setState(() {
                                        isloading =true;
                                      });
                                      loginRepo.loginUser(emailCont.text.trim().toString(), passCont.text.trim().toString(), context).then((value) {

                                        if(value.status==1)
                                        {
                                          userrepo.getUser(email:value.userRegistrationEmail).then((profile) {
                                            setState(()
                                            {
                                              isloading = false;
                                            });
                                            if(profile.status==1)
                                            {
                                              setState(()
                                              {
                                                SharedPreferencesTest()
                                                    .saveuserdata("set", userdata: profile);
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                                                {
                                                  return MainListPage();
                                                }));
                                              });
                                            }
                                            else
                                            {
                                              showAlertDialog(context,value.message,"");
                                            }
                                          }).catchError((onError)
                                          {
                                            setState(() {
                                              isloading = false;
                                            });
                                          });

                                        }
                                        else
                                        {
                                          setState(() {
                                            isloading = false;
                                          });
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
                                  child: Text("Login",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                                  SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),),
                                ),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,size: SizeConfig.blockSizeVertical*2.75,)


                              ],
                            )),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child:  Text("New Here ? ",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                          SizeConfig.blockSizeVertical*2.15,color: Colors.black,fontWeight:
                          FontWeight.w500)),)),
                          InkWell(
                            onTap: ()
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterScreen()),
                              );
                            },
                            child: Container(child:  Text("Register",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                            SizeConfig.blockSizeVertical*2.15,color:appredcolor ,fontWeight: FontWeight.w500)),)),
                          )


                        ],),),

/*
>>>>>>> 85114e0be3afde7606b3096914345e56e5937029
                    InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPassword()),
                        );
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: SizeConfig.blockSizeHorizontal*34,
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*36.5),
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.4,
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.0,),
                          ),
                              color: appredcolor
                          ),
                          child:Text("Google",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                          SizeConfig.blockSizeVertical*2.1,color: Colors.white,fontWeight: FontWeight.w600)),)),
                    )
<<<<<<< HEAD
=======
*/
                  ],
                ),



              ],
            ),
          ),),),),
      ),
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
  Future fbLogin({BuildContext context}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SocialLogin().fbLogin(context: context).then((value) async {
          // Dialogs.showLoadingDialog(context, loginloader);
          if (value != null &&
              value != "") {
            setState(() {
              isloading = true;
            });
            fbrepo.loginUser(value.profile['email']!=null?value.profile['email']:"", value.profile['picture']['data']['url'], context).then((fbdata) {
              setState(() {
                isloading = false;
              });
              if(fbdata.status==1)
              {
                setState(()
                {
                  isloading = false;
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                {
                  return MobileScreen();
                }));
              /*  userrepo.getUser(email:value.profile['email']).then((profile) {
                  setState(()
                  {
                    isloading = false;
                  });
                  if(profile.status==1)
                  {
                    setState(()
                    {
                      SharedPreferencesTest()
                          .saveuserdata("set", userdata: profile);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                      {
                        return MainListPage();
                      }));
                    });
                  }
                  else
                  {
                    showAlertDialog(context,fbdata.message,"");
                  }
                }).catchError((onError)
                {
                  setState(() {
                    isloading = false;
                  });
                });*/
              }
              else
              {
                setState(() {
                  isloading = false;
                });
                showAlertDialog(context,fbdata.message,"");
              }
            }).catchError((error){
              setState(() {
                isloading = false;
              });
            });

          } else {
            setState(() {
              isloading = false;
            });
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
            googlerepo.googlelogin(value.googleProfile.email, value.googleProfile.photoUrl, context).then((googdata) {
              setState(() {
                isloading = false;
              });
              if(googdata.status==1)
              {
                setState(()
                {
                  isloading = false;
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                {
                  return MobileScreen();
                }));
    /*            userrepo.getUser(email:value.googleProfile.email).then((profile) {
                  setState(()
                  {
                    isloading = false;
                  });
                  if(profile.status==1)
                  {
                    setState(()
                    {
                      SharedPreferencesTest()
                          .saveuserdata("set", userdata: profile);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                      {
                        return MainListPage();
                      }));
                    });
                  }
                  else
                  {
                    showAlertDialog(context,googdata.message,"");
                  }
                }).catchError((onError)
                {
                  setState(() {
                    isloading = false;
                  });
                });*/
              }
              else
              {
                setState(() {
                  isloading = false;
                });
                showAlertDialog(context,googdata.message,"");
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