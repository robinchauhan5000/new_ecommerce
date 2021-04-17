import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_ecommerce/ui/EditProfile2.dart';
import 'package:flutter_ecommerce/ui/ResetPassword.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'dart:io';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce/models/LoginEntity.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/data/repo/GetLoginUser.dart';
import 'package:flutter_ecommerce/utils/CommonUtils.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_ecommerce/utils/CWActionSheetScreen.dart';
import 'package:images_picker/images_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_ecommerce/data/repo/UpdateProfile.dart';

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
  GetLoginUserEntity entity = new GetLoginUserEntity();
  var mobfocus = FocusNode();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  String currentpin = "";
  bool isRegisterd = false;
  String id;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  GetLoginUserEntity userdata = new GetLoginUserEntity();
  var userrepo = new GetLoginUser();
  var updateprofile = new UpdateProfileRepo();
  var applogo = "";
  bool hasError = false,
      iscode = false,
      isdetail = false,
      isinterest = false,
      isloading = false;
  File _image;
  String imagepath;
  StreamController<ErrorAnimationType> errorController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = true;
    SharedPreferencesTest().saveuserdata("get").then((value) {
      setState(() {
        Map userupdateddata = json.decode(value);
        entity = GetLoginUserEntity.fromJson(userupdateddata);
        userrepo.getUser(email:entity.docs.elementAt(0).userEmail).then((value) {
          setState(() {
            isloading = false;
          });
          if(value.status==1)
            {
              setState(() {
                username.text = value.docs.elementAt(0).userName;
                emailCont.text = value.docs.elementAt(0).userEmail;
                mobilenumber.text = value.docs.elementAt(0).userMobile;
                imagepath = value.docs.elementAt(0).userProfileImage;
                id = value.docs.elementAt(0).sId;
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
      });
    });
    errorController = StreamController<ErrorAnimationType>.broadcast();
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
          width: SizeConfig.blockSizeHorizontal*100,
          height: SizeConfig.blockSizeVertical*100,
          decoration: new BoxDecoration(image: DecorationImage(image:
          AssetImage('assets/editprofile.png'),fit: BoxFit.fill)),
          child: SingleChildScrollView(child: Container(child:
              Form(
                key: formKey,
                autovalidate: autoValidate,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2,
                              left: SizeConfig.blockSizeHorizontal*4),
                          child: Icon(Icons.arrow_back,size:
                          SizeConfig.blockSizeVertical*5.5,color: Colors.white,),),
                      ),
                     /* Container(
                        alignment: Alignment.centerRight,
                       margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2,
                           right: SizeConfig.blockSizeHorizontal*4),
                        child: Icon(Icons.notifications_on_outlined,size:
                      SizeConfig.blockSizeVertical*5.5,color: Colors.white,),),*/
                    ],
                  ),
                  InkWell(
                    onTap: ()
                    {

                    },
                    child:/*Container(
                      width: SizeConfig.blockSizeHorizontal * 33,
                      height: SizeConfig.blockSizeHorizontal * 33,
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,color: appmaincolor,

                        image: DecorationImage(image:
                         FileImage(File(""))),
                        ),
                      ),*/
                    imagepath != null &&
                        imagepath != ""
                        ? CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 14,
                        backgroundColor: appmaincolor,
                        backgroundImage: CachedNetworkImageProvider(
                            imagepath!=null?imagepath:""))
                        : CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 14,
                        backgroundColor: appmaincolor,
                        backgroundImage: FileImage(
                            File(_image != null ? _image.path : "")))
                    ),
                  InkWell(
                    onTap: ()
                    {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) =>
                              ActionSheet().actionSheet(context, onCamera: () {
                                FocusScope.of(context).unfocus();
                                chooseCameraFile().then((File file) {
                                  if (file != null) {
                                    setState(() {
                                      //   loading = true;
                                    });
                                  }
                                }).catchError((onError) {});
                              }, onGallery: () {
                                FocusScope.of(context).unfocus();
                                if(Platform.isAndroid)
                                {
                                  androidchooseImageFile().then((value) {
                                    setState(() {
                                      //  loading = true;
                                    });
                                  }).catchError((onError) {});
                                } else {
                                  chooseImageFile().then((File file)
                                  {
                                    if (file != null) {
                                      setState(() {
                                        //  loading = true;
                                      });
                                    }
                                  }).catchError((onError) {});
                                }
                              }));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*3.5),
                        width:SizeConfig.blockSizeHorizontal*70,
                        height: SizeConfig.blockSizeVertical*5,
                        child: Text("Change Profile Picture",style: GoogleFonts.poppins(textStyle:
                        TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5,color: Colors.white,
                            fontWeight: FontWeight.w500)))),
                  ),
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

                      textInputAction: TextInputAction.done,
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
                      cursorColor:logincolor,focusNode: mobfocus,enabled: false,
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
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).unfocus(),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ResetPassword("Profile");
                      }));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                        width:SizeConfig.blockSizeHorizontal*100,
                        height: SizeConfig.blockSizeVertical*5,
                        child: Text("Reset Password",style: GoogleFonts.poppins(textStyle:
                        TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,color: Colors.white,
                            fontWeight: FontWeight.w600)))),
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
                          updateprofile.updateProfile(username.text.trim().toString(), imagepath, emailCont.text.trim().toString(), _image, id, context).then((value) {
                            setState(() {
                              isloading = false;
                            });
                            if(value.status==1)
                              {
                                showAlertDialog(context,value.message,"Updated");
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
  Future<File> chooseCameraFile() async {
    /*await ImagePicker().getImage(source: ImageSource.camera).then((image) {
      setState(() {
        _image = image;
      });
    });*/
    await ImagesPicker.openCamera(pickType: PickType.image, maxTime: 30)
        .then((value) {
      setState(() {
        FocusScope.of(context).unfocus();
        _image = new File(value.elementAt(0).path);
        imagepath = "";

      });
    }).catchError((error) {
      print(error.toString());
    });
    return _image;
  }

  Future<File> chooseImageFile() async {
    await ImagesPicker.pick(count: 1, pickType: PickType.image).then((value) {
      setState(() {
        FocusScope.of(context).unfocus();
        _image = new File(value.elementAt(0).path);
        imagepath= "";

      });
    }).catchError((error) {
      print(error.toString());
    });
    return _image;
  }


  Future<void> androidchooseImageFile() async {
    await await MultiImagePicker.pickImages(
      maxImages: 1,
      enableCamera: false,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        actionBarColor: "#0A79DF",
        actionBarTitle: "Smart Trucker",
        allViewTitle: "All Photos",
        useDetailsView: false,
        selectionLimitReachedText: "Please select 1 images at a time",
        selectCircleStrokeColor: "#0A79DF",
      ),
    ).then((value) {
      setState(() async {
        FocusScope.of(context).unfocus();

        for (int i = 0; i < value.length; i++) {
          var path = await FlutterAbsolutePath.getAbsolutePath(
              value.elementAt(i).identifier);
          _image = new File(path);
        }
        if(imagepath!=null) {
         imagepath = "";
        }

      });
    }).catchError((error) {
      print(error.toString());
    });
  }
}