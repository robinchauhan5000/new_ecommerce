import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/data/repo/CartListRepo.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/ui/EditProfile2.dart';
import 'package:flutter_ecommerce/ui/ItemListGrid.dart';
import 'package:flutter_ecommerce/ui/LoginScreen.dart';
import 'package:flutter_ecommerce/ui/ProductList.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:flutter_ecommerce/ui/CartListScreen.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';

class MainListPage extends StatefulWidget {
  @override
  _MainListPageState createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  GetLoginUserEntity entity = new GetLoginUserEntity();
  var textcont = new TextEditingController();
  var getItemsList = CartListRepo();
  bool isloading = false;
  var getListItemsModel = CartListEntity();
  List<Docs1> list = new List();
  @override
  void initState() {
    isloading = true;
    super.initState();
    SharedPreferencesTest().saveuserdata("get").then((value) {
      print(value);
      setState(() {
        Map userupdateddata = json.decode(value);
        entity = GetLoginUserEntity.fromJson(userupdateddata);
        getItemsList
            .cartListing(listId: entity.docs.elementAt(0).sId)
            .then((value) {
          setState(() {
            isloading = false;
          });
          if (value.status == 1) {
            setState(() {
              getListItemsModel = value;
            });
          }
        }).catchError((onError) {
          setState(() {
            isloading = false;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffE33B3B),
        onPressed: () {},
        child: Icon(
          Icons.shopping_cart,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff0D72A0),
        elevation: 0,
        actions: <Widget>[
          new NotificationWidget(
              iconColor: Colors.white,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      backgroundColor: Color(0XFFEFF2FF),
      drawer: Drawer(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Rectangle 55.jpg'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: SizeConfig.blockSizeVertical * 4.75,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage(''),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1.25),
                    child: Text(
                      entity.docs != null &&
                              entity.docs.elementAt(0).userName != null
                          ? entity.docs.elementAt(0).userName
                          : "",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeVertical * 2.25),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 0.08),
                    child: Text(
                      entity.docs != null
                          ? entity.docs.elementAt(0).userEmail
                          : "",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeVertical * 1.5),
                    ),
                  )
                ],
              ),
            ),
            Container(child: Image(image: AssetImage('assets/Line 1.jpg'))),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 4.5,
                    left: SizeConfig.blockSizeVertical * 4.5),
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);

              },
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 4.5,
                    left: SizeConfig.blockSizeVertical * 4.5),
                child: Text(
                  "My List",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditProfile2();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 4.5,
                    left: SizeConfig.blockSizeVertical * 4.5),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartScreen();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 4.5,
                    left: SizeConfig.blockSizeVertical * 4.5),
                child: Text(
                  "My Order",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.4,
            ),
            Container(child: Image(image: AssetImage('assets/Line 2.jpg'))),
            InkWell(
              onTap: () {
                SharedPreferencesTest().checkIsLogin("2");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 4.5,
                    left: SizeConfig.blockSizeVertical * 4.5),
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25),
                ),
              ),
            ),
          ],
        ),
      )),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Rectangle 25.png'),
                  fit: BoxFit.fill),
            ),
            height: SizeConfig.screenHeight * 0.48,
            width: SizeConfig.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.05,
                      bottom: SizeConfig.screenHeight * 0.05,
                    ),
                    child: Image(
                      image: AssetImage('assets/applogo.png'),
                      height: SizeConfig.blockSizeVertical * 8,
                      width: SizeConfig.screenWidth * 0.8,
                    )),
                Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 2.25),
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.07,
                      bottom: SizeConfig.screenHeight * 0.06),
                  width: SizeConfig.screenWidth * 0.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/tile.png'),
                          fit: BoxFit.fitWidth)),
                  child: TextFormField(
                    controller: textcont,
                    onChanged: (s) {
                      list.clear();
                      if (textcont.text.trim() != null &&
                          textcont.text.trim() != "") {

                        for (int i = 0;
                            i < getListItemsModel.docs.length;
                            i++) {
                          if (getListItemsModel.docs
                              .elementAt(i)
                              .shoppingLstName.toString().toLowerCase()
                              .contains(textcont.text.toString().toLowerCase())) {
                            list.add(getListItemsModel.docs.elementAt(i));
                          }
                        }
                      }
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search",
                        border: InputBorder.none),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemListGrid()),
                    ).then((value) {
                      getItemsList
                          .cartListing(listId: entity.docs.elementAt(0).sId)
                          .then((value) {
                        setState(() {
                          isloading = false;
                        });
                        if (value.status == 1) {
                          setState(() {
                            getListItemsModel = value;
                          });
                        }
                      }).catchError((onError) {
                        setState(() {
                          isloading = false;
                        });
                      });
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth * 0.7,
                    height: SizeConfig.screenHeight * 0.07,
                    child: Text(
                      "Create New List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Rectangle 26.png'),
                            fit: BoxFit.fill)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.03,
                bottom: SizeConfig.screenHeight * 0.03),
            child: Text(
              "Previous Lists",
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
            ),
          ),
          list.length > 0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: list != null
                          ? list.length > 0
                              ? list.length
                              : 0
                          : 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            debugPrint('List button pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductList(
                                        listId: list
                                            .elementAt(index)
                                            .sId,
                                        userId: entity.docs.elementAt(0).sId,
                                      )),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal * 2.5),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.all(
                                    SizeConfig.blockSizeHorizontal * 1.5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      2),
                                          child: Text(
                                            getListItemsModel.docs
                                                .elementAt(index)
                                                .shoppingLstName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            getListItemsModel != null &&
                                                list.length >
                                                        0 &&
                                                list
                                                            .elementAt(0)
                                                            .productDetails
                                                            .length >
                                                        0
                                                ? 'Item Qty: ${list.elementAt(0).productDetails.length}'
                                                : "",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    1.75),
                                          ),
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      1),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(list != null &&
                                            list.length >
                                                    0 &&
                                            list
                                                        .elementAt(0)
                                                        .productDetails
                                                        .length >
                                                    0
                                            ? 'Money Spent : ${list.elementAt(0).totalCost}'
                                            : ""),
                                        Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.green,
                                                    width: 1.0)),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.green,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: getListItemsModel.docs != null
                          ? getListItemsModel.docs.length > 0
                              ? getListItemsModel.docs.length
                              : 0
                          : 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            debugPrint('List button pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductList(
                                        listId: getListItemsModel.docs
                                            .elementAt(index)
                                            .sId,
                                        userId: entity.docs.elementAt(0).sId,
                                      )),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal * 2.5),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.all(
                                    SizeConfig.blockSizeHorizontal * 1.5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      2),
                                          child: Text(
                                            getListItemsModel.docs
                                                .elementAt(index)
                                                .shoppingLstName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            getListItemsModel != null &&
                                                    getListItemsModel
                                                            .docs.length >
                                                        0 &&
                                                    getListItemsModel.docs
                                                            .elementAt(0)
                                                            .productDetails
                                                            .length >
                                                        0
                                                ? 'Item Qty: ${getListItemsModel.docs.elementAt(0).productDetails.length}'
                                                : "",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    1.75),
                                          ),
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      1),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(getListItemsModel != null &&
                                                getListItemsModel.docs.length >
                                                    0 &&
                                                getListItemsModel.docs
                                                        .elementAt(0)
                                                        .productDetails
                                                        .length >
                                                    0
                                            ? 'Money Spent : ${getListItemsModel.docs.elementAt(0).totalCost}'
                                            : ""),
                                        Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.green,
                                                    width: 1.0)),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.green,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
    // widgetList.add(child);
    // if (isloading) {
    //   final modal = new Stack(
    //     children: [
    //       new Opacity(
    //         opacity: 0.5,
    //         child: ModalBarrier(dismissible: false, color: Colors.grey),
    //       ),
    //       new Center(
    //         child: new CircularProgressIndicator(
    //           valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
    //         ),
    //       ),
    //     ],
    //   );
    //   widgetList.add(modal);
    // }
    // return
    //     /* WillPopScope(
    //         onWillPop: ,
    //         child:*/
    //     Stack(children: widgetList);
  }
}
