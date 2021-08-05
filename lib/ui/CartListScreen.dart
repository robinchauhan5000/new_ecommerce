import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/data/repo/ListDetailRepo.dart';
import 'package:flutter_ecommerce/data/repo/UserCart.dart';
import 'package:flutter_ecommerce/models/CartEntity.dart';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';

class CartScreen extends StatefulWidget {
  String listId;
  String userId;
  CartScreen({this.listId, this.userId});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var getItemsList = ListDetailRepo();
  bool isloading = false;
  var getListItemsModel = CartEntity();
  GetLoginUserEntity entity = new GetLoginUserEntity();

  var cartrepo = UserCartRepo();
  @override
  void initState() {
    super.initState();
    isloading = true;
    SharedPreferencesTest().saveuserdata("get").then((value) {
      print(value);
      setState(() {
        Map userupdateddata = json.decode(value);
        entity = GetLoginUserEntity.fromJson(userupdateddata);
        cartrepo.usercart(listId: entity.docs.elementAt(0).sId).then((value) {
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
    var child = Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0D72A0),
        elevation: 0,
        actions: <Widget>[
          new NotificationWidget(
              iconColor: Colors.white,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      //    backgroundColor: Color(0XFFEFF2FF),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffE33B3B),
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Ellipse 2.png'), fit: BoxFit.fill)),
          child: Icon(
            Icons.shopping_cart,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Rectangle 55.png'),
                    fit: BoxFit.fill)),
            height: SizeConfig.screenHeight * 0.25,
            child: Column(
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.16,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/Rectangle 32.png',
                          ),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.screenHeight * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeConfig.blockSizeVertical * 5,
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: SizeConfig.blockSizeVertical * 3.25,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 2.25),
                              width: SizeConfig.screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/tile.png'),
                                      fit: BoxFit.fitWidth)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    hintText: "Search",
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            getListItemsModel.docs != null
                                ? getListItemsModel.docs
                                    .elementAt(0)
                                    .shoppingLstName
                                : "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 0.5,
                          ),
                          Text(
                            "Current List",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            getListItemsModel.docs != null
                                ? getListItemsModel.docs.elementAt(0).totalItems
                                : "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 0.5,
                          ),
                          Text(
                            "Total Items",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            getListItemsModel.docs != null
                                ? getListItemsModel.docs.elementAt(0).totalCost
                                : "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 0.5,
                          ),
                          Text(
                            "Total Cost",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 2,
              bottom: SizeConfig.blockSizeVertical * 2,
            ),
            child: Text(
              "Item Lists",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical * 2.25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: getListItemsModel.docs != null
                  ? getListItemsModel.addToCartDetails
                      .elementAt(0)
                      .shoppingListDetails
                      .elementAt(0)
                      .addedProducts
                      .length
                  : 0,
              itemBuilder: (context, index) {
                print(getListItemsModel.addToCartDetails
                    .elementAt(0)
                    .shoppingListDetails
                    .elementAt(0)
                    .addedProducts
                    .length);
                var productname = "";
                var productimage = "";
                if (getListItemsModel.addToCartDetails != null) {
                  for (int i = 0;
                      i <
                          getListItemsModel.addToCartDetails
                              .elementAt(0)
                              .shoppingListDetails
                              .elementAt(0)
                              .addedProducts
                              .length;
                      i++) {
                    for (int j = 0;
                        j <
                            getListItemsModel.docs
                                .elementAt(0)
                                .productDetails
                                .length;
                        j++) {
                      if (getListItemsModel.addToCartDetails
                              .elementAt(0)
                              .shoppingListDetails
                              .elementAt(0)
                              .addedProducts
                              .elementAt(i)
                              .productId ==
                          getListItemsModel.docs
                              .elementAt(0)
                              .productDetails
                              .elementAt(j)
                              .sId) {
                        getListItemsModel.addToCartDetails
                                .elementAt(0)
                                .shoppingListDetails
                                .elementAt(0)
                                .addedProducts
                                .elementAt(i)
                                .image =
                            getListItemsModel.docs
                                .elementAt(0)
                                .productDetails
                                .elementAt(j)
                                .productImage
                                .elementAt(0);
                        getListItemsModel.addToCartDetails
                                .elementAt(0)
                                .shoppingListDetails
                                .elementAt(0)
                                .addedProducts
                                .elementAt(i)
                                .name =
                            getListItemsModel.docs
                                .elementAt(0)
                                .productDetails
                                .elementAt(j)
                                .productName;
                      }
                    }
                  }
                }
                return /*ListTile(
                    onTap: () {},
                    title: Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 2),
                      child: Text(
                        getListItemsModel != null &&
                                getListItemsModel.docs != null &&
                                getListItemsModel.docs.length > 0 &&
                                getListItemsModel.docs
                                        .elementAt(0)
                                        .productDetails
                                        .length >
                                    0
                            ? getListItemsModel.docs
                                .elementAt(0)
                                .productDetails
                                .elementAt(index)
                                .productName
                            : "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(
                        'Qty: ${getListItemsModel != null && getListItemsModel.docs != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productQuantity : ""} Pc  |  Price: \$${getListItemsModel != null && getListItemsModel.docs != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productPrice : ""}'),
                    leading: Image(image: AssetImage('assets/dove.jpg')),
                    trailing: Container(
                      width: SizeConfig.screenWidth * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.red,
                                )),
                            child: ImageIcon(
                              AssetImage('assets/minus.png'),
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            child: Text("1"),
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 1.5,
                              right: SizeConfig.blockSizeHorizontal * 1.5,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                )),
                            child: ImageIcon(
                              AssetImage('assets/plus.png'),
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ));*/
                    Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 2.5,
                      right: SizeConfig.blockSizeHorizontal * 2.5),
                  padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1.5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Row(
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 15,
                        height: SizeConfig.blockSizeHorizontal * 17,
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal * 2.5),
                        decoration: BoxDecoration(
                            image: new DecorationImage(
                                image: CachedNetworkImageProvider(
                                    getListItemsModel.addToCartDetails
                                        .elementAt(0)
                                        .shoppingListDetails
                                        .elementAt(0)
                                        .addedProducts
                                        .elementAt(index)
                                        .image))),
                      ),
                      Container(
                          width: SizeConfig.blockSizeHorizontal * 53,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: SizeConfig.blockSizeVertical * 2),
                                child: Text(
                                  getListItemsModel.addToCartDetails
                                      .elementAt(0)
                                      .shoppingListDetails
                                      .elementAt(0)
                                      .addedProducts
                                      .elementAt(index)
                                      .name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 0.25),
                                child: Text(
                                  "Price : \$" +
                                      (getListItemsModel.docs != null
                                          ? getListItemsModel.addToCartDetails
                                              .elementAt(0)
                                              .shoppingListDetails
                                              .elementAt(0)
                                              .addedProducts
                                              .elementAt(index)
                                              .finalPrice
                                          : ""),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          width: SizeConfig.screenWidth * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.red,
                                    )),
                                child: ImageIcon(
                                  AssetImage('assets/minus.png'),
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                child: Text(getListItemsModel.docs != null
                                    ? getListItemsModel.addToCartDetails
                                        .elementAt(0)
                                        .shoppingListDetails
                                        .elementAt(0)
                                        .addedProducts
                                        .elementAt(index)
                                        .finalQuantity
                                    : ""),
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 1.5,
                                  right: SizeConfig.blockSizeHorizontal * 1.5,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.green,
                                    )),
                                child: ImageIcon(
                                  AssetImage('assets/plus.png'),
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
          )
        ],
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
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
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
