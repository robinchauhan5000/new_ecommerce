import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:flutter_ecommerce/Widgets/ItemGrid.dart';
import 'package:flutter_ecommerce/data/repo/CartListRepo.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';

class ItemListGrid extends StatefulWidget {
  @override
  _ItemListGridState createState() => _ItemListGridState();
}

class _ItemListGridState extends State<ItemListGrid> {
  var getItemsList = CartListRepo();
  bool isloading = false;
  var getListItemsModel = CartListEntity();

  @override
  void initState() {
    super.initState();
    isloading = true;
    getItemsList.cartListing(listId: "607403e966e9d3293fba2fae").then((value) {
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
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child =  Scaffold(
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
        child: FloatingActionButton(onPressed: (){},
          backgroundColor: Color(0xffE33B3B),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Ellipse 2.png'),
                    fit: BoxFit.fill
                )
            ),
            child: Icon(
              Icons.shopping_cart,
            ),
          ),),
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
                      fit: BoxFit.fill
                  )
              ),
              height: SizeConfig.screenHeight * 0.25,
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Rectangle 32 mylist.png',),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.05
                          ),
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
                                    left: SizeConfig.blockSizeHorizontal*2.25
                                ),
                                width:SizeConfig.screenWidth * 0.8,
                                decoration: BoxDecoration(
                                    image:  DecorationImage(
                                        image: AssetImage('assets/tile mylist.png'),
                                        fit: BoxFit.fitWidth
                                    )),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      suffixIcon:Icon(Icons.search) ,
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
                        top: SizeConfig.blockSizeVertical * 2.5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Monthly",style: TextStyle(color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
                            Text("Current List",style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("${getListItemsModel !=null && getListItemsModel.docs!= null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? getListItemsModel.docs.elementAt(0).productDetails.length.toString():""}",style: TextStyle(color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
                            Text("Total Items",style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("${getListItemsModel !=null && getListItemsModel.docs!= null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? getListItemsModel.docs.elementAt(0).totalCost:""}",style: TextStyle(color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
                            Text("Total Cost",style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2.25),
              child: GridView.builder(
                itemCount: getListItemsModel != null && getListItemsModel.docs!=null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0) != null && getListItemsModel.docs.elementAt(0).productDetails.length > 0? getListItemsModel.docs.elementAt(0).productDetails.length:0,
                itemBuilder: (context, index){
                  return itemGrid(context,getListItemsModel != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productQuantity:"",getListItemsModel != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ?getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productName : 0,getListItemsModel != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ?getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productPrice:"");
                },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4/4,
                  crossAxisSpacing: SizeConfig.blockSizeHorizontal * 6,
                  mainAxisSpacing: SizeConfig.blockSizeVertical * 3,
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
