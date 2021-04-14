import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:flutter_ecommerce/ui/MainLists.dart';

Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
Color shadowColorGlobal = Colors.black12;
Color appBarBackgroundColorGlobal = Colors.white;

double defaultRadius = 8.0;
double defaultBlurRadius = 5.0;
double defaultSpreadRadius = 2.0;

double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;

double tabletBreakpointGlobal = 720.0;
double desktopBreakpointGlobal = 1200.0;
List<BoxShadow> defaultBoxShadow({
  Color shadowColor,
  double blurRadius,
  double spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: shadowColor ?? shadowColorGlobal,
      blurRadius: blurRadius ?? defaultBlurRadius,
      spreadRadius: spreadRadius ?? defaultSpreadRadius,
      offset: offset,
    )
  ];
}
showAlertDialog(BuildContext context, String message, String type,{double rate,bool isfeedback}) {
  // set up the buttons
  // set up the buttons;

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    contentPadding: EdgeInsets.zero,
    content: Container(
      height: 200,
      width: 50,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4.0),
            color: appmainthemecolor,
            child: Center(
                child: Image.asset("assets/popup_info.png",
                    height: 30, width: 30)),
          ),
        ),
        Container(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    message == "Token is not valid"
                        ? "Your Session is expired.Please Login again"
                        : message
                    /* "Your Session is expired.Please Login again"*/,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 10),
                child: Material(
                  color: appmainthemecolor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(8.0),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      if(type == "otp"){
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return MainListPage();
                        }));*/
                      }else if(type == "login"){
                        /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return MainListPage();
                        }));*/
                      }
                    },
                    /*   onTap: () async {
                      try {
                        final result =
                        await InternetAddress.lookup(
                            'google.com');
                        if (result.isNotEmpty &&
                            result[0].rawAddress.isNotEmpty) {
                          SharedPreferencesTest()
                              .checkIsLogin("2");
                          Navigator.of(context)
                              .pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DTSignInScreen()),
                                  (Route<dynamic> route) =>
                              false);
                        }
                      } on SocketException catch (_) {
                        Fluttertoast.showToast(
                            msg: "No Internet Connection",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },*/
                    child: Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.only(top: 13),
                      child: Text(
                        message == "Token is not valid" ? "LOGOUT" : "OK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ]),
    ),
  );

  // show the dialog
  showDialog(
    context: context,barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}