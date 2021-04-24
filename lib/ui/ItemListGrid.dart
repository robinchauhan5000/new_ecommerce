import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:flutter_ecommerce/Widgets/ItemGrid.dart';
import 'package:flutter_ecommerce/data/repo/CartListRepo.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce/data/repo/ProductListing.dart';
import 'package:flutter_ecommerce/models/ProductListingEntity.dart';
import 'package:flutter_ecommerce/utils/CommonUtils.dart';
import 'package:flutter_ecommerce/models/AddedItems.dart';
import 'package:flutter_ecommerce/data/repo/CreateListRepo.dart';
import 'dart:convert';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/data/repo/CartListRepo.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'package:flutter_ecommerce/data/repo/AddedCartItemsRepo.dart';
import 'package:flutter_ecommerce/constant/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';


class ItemListGrid extends StatefulWidget {
  @override
  _ItemListGridState createState() => _ItemListGridState();
}

class _ItemListGridState extends State<ItemListGrid> {
  var productListingRepo = ProductListingRepo();
  GetLoginUserEntity entity = new GetLoginUserEntity();
  final textsearch = new TextEditingController();
  bool isloading = false;
  List<ProductListingEntity> productList = [];
  List<ProductListingEntity> templist = [];
  var totalamt =0.0;
  var repo = CreateListRepo();
  final TextEditingController listname = new TextEditingController();
  var cartrepo = AddedCartItemsRepo();
  @override
  void initState() {
    super.initState();
    isloading = true;
    SharedPreferencesTest().saveuserdata("get").then((value) {
      print(value);
      setState(() {
        Map userupdateddata = json.decode(value);
        entity = GetLoginUserEntity.fromJson(userupdateddata);
        productListingRepo.listing().then((value) {
          setState(() {
            isloading = false;
          });
          if (value != null) {
            setState(() {
              productList = value;
              for (int i=0;i<productList.length;i++)
              {
                totalamt = totalamt+double.parse(productList.elementAt(i).productPrice);
              }
              print(productList.length);
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
      backgroundColor: Color(0XFFEFF2FF),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              var isall = false;
              for (int i=0;i<productList.length;i++)
                {
                  if(productList.elementAt(i).count>0)
                    {
                      isall = true;
                      break;
                    }
                }
              if(listname.text.trim()==null || listname.text.trim()=="")
                {
                  showAlertDialog(context,"Please Enter Listname","");
                }
              else if(isall)
                {
                  setState(() {
                    isloading = true;
                  });
                  List<Additems> items =new List();
                  for (int i=0;i<productList.length;i++)
                  {
                     if(productList.elementAt(i).count >0)
                       {
                         productList.elementAt(i).productPrice = (double.parse(productList.elementAt(i).productPrice)*productList.elementAt(i).count).toString();
                         items.add(new Additems(productList.elementAt(i).sId,productList.elementAt(i).productPrice,productList.elementAt(i).count.toString()));
                       }
                  }
                  repo.addlist(totalamt.toString(), items, entity.docs.elementAt(0).sId, productList.length.toString(),listname.text.trim().toString(),
                      context).then((value) {
                    if(value.status==1)
                      {
                        var idlist = new List<String>();
                        idlist.add(value.docs.sId);
                        setState(() {
                          isloading = false;
                        });
                        showAlertDialog(context,value.message,"Cart");
             /*           cartrepo.cartItems(idlist, entity.docs.elementAt(0).sId, context).then((cart) {
                          setState(() {
                            isloading = false;
                          });
                          if(cart.status==1)
                            {
                              showAlertDialog(context,value.message,"Cart");
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
                        });*/
                      }
                    else
                      {
                        setState(() {
                          isloading = false;
                        });
                        showAlertDialog(context,value.message,"");
                      }
                  }).catchError((error){
                    setState(() {
                      isloading = false;
                    });
                  });
                }
              else
                {
                  showAlertDialog(context,"No Item Selected","");
                }
            });
          },
          backgroundColor: Color(0xffE33B3B),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Ellipse 2.png'),
                    fit: BoxFit.fill)),
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Rectangle 55 mylist.png'),
                      fit: BoxFit.fill)),
              height: SizeConfig.screenHeight * 0.25,
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/Rectangle 32 mylist.png',
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
                                    left:
                                        SizeConfig.blockSizeHorizontal * 2.25),
                                width: SizeConfig.screenWidth * 0.8,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/tile mylist.png'),
                                        fit: BoxFit.fitWidth)),
                                child: TextFormField(
                                  controller: textsearch,
                                  onChanged: (s) {
                                    templist.clear();
                                    if (textsearch.text.trim() != null &&
                                        textsearch.text.trim() != "") {

                                      for (int i = 0;
                                      i < productList.length;
                                      i++) {
                                        if (productList
                                            .elementAt(i)
                                            .productName.toString().toLowerCase()
                                            .contains(textsearch.text.toString().toLowerCase())) {
                                          templist.add(productList.elementAt(i));
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Monthly",
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
                              productList.length.toString(),
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
                              totalamt.toString(),
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
                  ),
                ],
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
                controller: listname,
                cursorColor:logincolor,
                style: TextStyle(fontSize: 16.0 ),showCursor: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: "Listname",hintStyle:
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
            templist.length>0?
            Container(
              margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2.25),
              child: GridView.builder(
                itemCount: templist.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeVertical * 3)),
                    elevation: 2.0,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: templist
                              .elementAt(index)
                              .productImage
                              .elementAt(0),
                          width: SizeConfig.screenWidth * 0.25,
                          height: SizeConfig.screenHeight * 0.1,
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                templist.elementAt(index).productName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                    SizeConfig.blockSizeVertical * 1.75,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Price \$${templist.elementAt(index).productPrice}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: SizeConfig.blockSizeVertical * 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 0.5),
                          height: SizeConfig.blockSizeVertical * 2.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Qty : ${templist.elementAt(index).productPrice}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                    SizeConfig.blockSizeVertical * 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 15,
                                height: SizeConfig.blockSizeVertical * 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (templist.elementAt(index).count >
                                            0) {
                                          templist.elementAt(index).count =
                                              templist
                                                  .elementAt(index)
                                                  .count -
                                                  1;
                                        }
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.red,
                                              )),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.red,
                                            size: SizeConfig.blockSizeVertical *
                                                1.5,
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              1.5,
                                          right:
                                          SizeConfig.blockSizeHorizontal *
                                              1.5),
                                      child: Text(
                                        templist
                                            .elementAt(index)
                                            .count
                                            .toString(),
                                        style: TextStyle(),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        templist.elementAt(index).count =
                                            templist.elementAt(index).count +
                                                1;
                                        setState(() {});
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.green,
                                              )),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.green,
                                            size: SizeConfig.blockSizeVertical *
                                                1.5,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 4,
                  crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                  mainAxisSpacing: SizeConfig.blockSizeVertical * 2,
                  crossAxisCount: 2,
                ),
              ),
            ):
            Container(
              margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2.25),
              child: GridView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeVertical * 3)),
                    elevation: 2.0,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: productList
                              .elementAt(index)
                              .productImage
                              .elementAt(0),
                          width: SizeConfig.screenWidth * 0.25,
                          height: SizeConfig.screenHeight * 0.1,
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                productList.elementAt(index).productName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.75,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Price \$${productList.elementAt(index).productPrice}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: SizeConfig.blockSizeVertical * 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 0.5),
                          height: SizeConfig.blockSizeVertical * 2.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Qty : ${productList.elementAt(index).productPrice}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 15,
                                height: SizeConfig.blockSizeVertical * 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (productList.elementAt(index).count >
                                            0) {
                                          productList.elementAt(index).count =
                                              productList
                                                      .elementAt(index)
                                                      .count -
                                                  1;
                                        }
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.red,
                                              )),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.red,
                                            size: SizeConfig.blockSizeVertical *
                                                1.5,
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              1.5,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  1.5),
                                      child: Text(
                                        productList
                                            .elementAt(index)
                                            .count
                                            .toString(),
                                        style: TextStyle(),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        productList.elementAt(index).count =
                                            productList.elementAt(index).count +
                                                1;
                                        setState(() {});
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.green,
                                              )),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.green,
                                            size: SizeConfig.blockSizeVertical *
                                                1.5,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 4,
                  crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                  mainAxisSpacing: SizeConfig.blockSizeVertical * 2,
                  crossAxisCount: 2,
                ),
              ),
            )
          ],
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
