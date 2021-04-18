import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/ProductList.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/ui/EditProfile2.dart';
import 'package:flutter_ecommerce/ui/ItemListGrid.dart';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'dart:convert';
import 'package:flutter_ecommerce/models/GetLoginUserEntity.dart';
import 'package:flutter_ecommerce/data/repo/CartListRepo.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';

class MainListPage extends StatefulWidget {
  @override
  _MainListPageState createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  GetLoginUserEntity entity = new GetLoginUserEntity();

  var getItemsList = CartListRepo();
  bool isloading = false;
  var getListItemsModel = CartListEntity();

  @override
  void initState() {
    isloading = true;
    super.initState();
    SharedPreferencesTest().saveuserdata("get").then((value) {
      setState(() {
        Map userupdateddata = json.decode(value);
        entity = GetLoginUserEntity.fromJson(userupdateddata);
    getItemsList.cartListing(listId: entity.docs.elementAt(0).sId).then((value) {
      setState(() {
        isloading = false;
      });
    if(value.status == 1){
     setState(() {
       getListItemsModel = value;
     });
    }
    }).catchError((onError)
    {
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
                    fit: BoxFit.cover
                )
            ),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.blockSizeVertical * 4.75,
                        backgroundColor: Colors.white,
                        child: Image(image: AssetImage(''),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.25
                        ),
                        child: Text(entity.docs != null && entity.docs.elementAt(0).userName!=null?entity.docs.elementAt(0).userName:"",style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockSizeVertical * 2.25
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 0.08
                        ),
                        child: Text(entity.docs!=null?entity.docs.elementAt(0).userEmail:"",style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockSizeVertical *1.5
                        ),),
                      )
                    ],
                  ),
                ),
                Container(child: Image(image: AssetImage('assets/Line 1.jpg'))),
                InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 4.5,
                        left: SizeConfig.blockSizeVertical * 4.5
                    ),
                    child: Text("Home",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockSizeVertical * 2.25
                    ),),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemListGrid()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 4.5,
                        left: SizeConfig.blockSizeVertical * 4.5
                    ),
                    child: Text("My List",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockSizeVertical * 2.25
                    ),),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return EditProfile2();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 4.5,
                        left: SizeConfig.blockSizeVertical * 4.5
                    ),
                    child: Text("Profile",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockSizeVertical * 2.25
                    ),),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.4,
                ),
                Container(child: Image(image: AssetImage('assets/Line 2.jpg'))),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4.5,
                      left: SizeConfig.blockSizeVertical * 4.5
                  ),
                  child: Text("Logout",style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25
                  ),),
                ),


              ],
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Rectangle 25.png'),
                    fit: BoxFit.fill
                ),
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
                      child: Image(image: AssetImage('assets/applogo.png'),
                        height: SizeConfig.blockSizeVertical * 8,
                        width: SizeConfig.screenWidth * 0.8,)
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal*2.25
                    ),
                    margin: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.07,
                        bottom: SizeConfig.screenHeight * 0.06
                    ),
                    width: SizeConfig.screenWidth * 0.8,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/tile.png'),
                            fit: BoxFit.fitWidth
                        )),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon:Icon(Icons.search) ,
                          hintText: "Search",
                          border: InputBorder.none),
                    ),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItemListGrid()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: SizeConfig.screenWidth * 0.7,
                      height: SizeConfig.screenHeight * 0.07,
                      child: Text(
                        "Create New List",
                        style: TextStyle(color: Colors.white,
                            fontSize: SizeConfig.blockSizeVertical * 2.5,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Rectangle 26.png'),
                              fit: BoxFit.fill
                          )),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.03,
                  bottom: SizeConfig.screenHeight * 0.03 ),
              child: Text(
                "Previous Lists",
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,itemCount: getListItemsModel != null && getListItemsModel.docs!=null &&
                getListItemsModel.docs.length > 0 ? getListItemsModel.docs.elementAt(0).productDetails.length:0,
              itemBuilder: (context,index) {
                return Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.05,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                    onTap: () {
                      print("xbjcbj");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductList()),
                      );
                    },
                    title: Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 2
                      ),
                      child: Text('Monthly List', style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    subtitle: Text(getListItemsModel != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length>0 ? 'Money Spent : ${getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productPrice}':""),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(child: Text(getListItemsModel != null  && getListItemsModel.docs.length>0 &&getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? 'Item Qty: ${getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productQuantity}':"",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: SizeConfig.blockSizeVertical * 1.75
                          ),),
                          margin: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeVertical * 1
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.green, width: 1.0)),
                            child: Icon(Icons.add, color: Colors.green,))
                      ],
                    ),
                  ),
                );
              }

            ),
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
