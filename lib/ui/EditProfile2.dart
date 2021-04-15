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
import 'package:flutter_ecommerce/ui/EditProfile.dart';
import 'dart:convert';
import 'package:flutter_ecommerce/models/LoginEntity.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/data/repo/GetLoginUser.dart';
import 'package:flutter_ecommerce/utils/CommonUtils.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce/data/repo/UpdateAddress.dart';

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
  var updateaddress = new UpdateAddress();
  var applogo = "";
  bool hasError = false,
      iscode = false,
      isdetail = false,
      isinterest = false,
      isloading = false;
  var userrepo = new GetLoginUser();
  GetLoginUserEntity entity = new GetLoginUserEntity();
  StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = false;
    SharedPreferencesTest().saveuserdata("get").then((value) {
      setState(() {
        Map userupdateddata = json.decode(value);
        entity = GetLoginUserEntity.fromJson(userupdateddata);
        address.text = entity.docs.elementAt(0).userAddress!=null? entity.docs.elementAt(0).userAddress:"";
        state.text = entity.docs.elementAt(0).userState!=null? entity.docs.elementAt(0).userState:"";
        country.text = entity.docs.elementAt(0).userCountry!=null? entity.docs.elementAt(0).userCountry:"";
        zipCode.text = entity.docs.elementAt(0).userZipCode!=null? entity.docs.elementAt(0).userZipCode:"";

      });
    });
    errorController = StreamController<ErrorAnimationType>.broadcast();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child =  SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: entity!=null? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.46,
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
                          InkWell(
                            onTap:()
            {
              Navigator.pop(context);
            },
                            child: Icon(Icons.arrow_back,
                              color: Colors.white,
                            size: SizeConfig.blockSizeHorizontal * 10,),
                          ),
                         /* Icon(Icons.notifications_active_outlined,
                            color: Colors.white,
                            size: SizeConfig.blockSizeHorizontal * 10,)*/
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
                            CachedNetworkImageProvider("")),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                            alignment: Alignment.center,
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*3,
                            child: Text(entity.docs.elementAt(0).userName,
                                style: GoogleFonts.poppins(textStyle:
                            TextStyle(fontSize: SizeConfig.blockSizeVertical*2.25,color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                        Container(
                          margin:EdgeInsets.only(top: SizeConfig.screenHeight * 0.005,
                          bottom:  SizeConfig.screenHeight * 0.005),
                            alignment: Alignment.center,
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*3,
                            child: Text(entity.docs.elementAt(0).userEmail,
                                style: GoogleFonts.poppins(textStyle:
                            TextStyle(fontSize: SizeConfig.blockSizeVertical*1.5,color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                        Container(
                            alignment: Alignment.center,
                            width:SizeConfig.blockSizeHorizontal*70,
                            height: SizeConfig.blockSizeVertical*3.5,
                            child: Text(entity.docs.elementAt(0).userMobile,style: GoogleFonts.poppins(textStyle:
                            TextStyle(fontSize: SizeConfig.blockSizeVertical*1.6,color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return EditProfile();
                            }));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: SizeConfig.blockSizeHorizontal*22.5,
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical*0.1,
                                  bottom: SizeConfig.blockSizeVertical*0.1),
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.6,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/edit button.png'),
                                )
                              ),
                              child:Text("Edit",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize:
                              SizeConfig.blockSizeVertical*2.2,color: Colors.white,fontWeight: FontWeight.w600)),)),
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
                      Container(child: Text("Address",style: TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*2,fontWeight: FontWeight.w600),),
                       ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/tile2.png'),
                                fit: BoxFit.fitWidth
                            )
                        ),
                        child: TextFormField(
                          focusNode: addressFocus,
                          controller: address,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: InputBorder.none,contentPadding: EdgeInsets.all(8.0)
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
                      Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
                        child: Text("State",style: TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*2,fontWeight: FontWeight.w600),),
                      ),
                      Container(
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
                              border: InputBorder.none,contentPadding: EdgeInsets.all(8.0)
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
                      Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
                        child: Text("Country",style: TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*2,fontWeight: FontWeight.w600),),
                      ),
                      Container(
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
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none,contentPadding: EdgeInsets.all(8.0)
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
                      Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
                        child: Text("Zipcode",style: TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*2,fontWeight: FontWeight.w600),),
                      ),
                      Container(
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
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none,contentPadding: EdgeInsets.all(8.0)
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
                      InkWell(
                        onTap: ()
                        {
                          if (formKey.currentState.validate())
                          {
                            formKey.currentState.save();
                            setState(() {
                              isloading = true;
                            });
                            updateaddress.updateAddress(address.text.trim().toString(), state.text.trim().toString(),
                                country.text.trim().toString(), zipCode.text.toString(), entity.docs.elementAt(0).sId, context).then((value) {
                              setState(() {
                                isloading = false;
                              });
                              if(value.status==1)
                                {
                                  entity.docs.elementAt(0).userAddress = value.docs.userAddress;
                                  entity.docs.elementAt(0).userState = value.docs.userState;
                                  entity.docs.elementAt(0).userCountry = value.docs.userCountry;
                                  entity.docs.elementAt(0).userZipCode = value.docs.userZipCode;
                                  SharedPreferencesTest()
                                      .saveuserdata("set", userdata: entity);
                                  showAlertDialog(context,value.message,"UpdateProfile");
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

                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              alignment: Alignment.center,
                              width: SizeConfig.blockSizeHorizontal*22.5,
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical*3,
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
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ):SizedBox(),
        ),
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
}
