import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:flutter_ecommerce/Widgets/ItemGrid.dart';
import 'package:flutter_ecommerce/data/repo/CartListRepo.dart';
import 'package:flutter_ecommerce/models/CartListEntity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce/data/repo/ProductListing.dart';
import 'package:flutter_ecommerce/models/ProductListingEntity.dart';
class ItemListGrid extends StatefulWidget {
  @override
  _ItemListGridState createState() => _ItemListGridState();
}

class _ItemListGridState extends State<ItemListGrid> {
  var productListingRepo = ProductListingRepo();
  bool isloading = false;
  List<ProductListingEntity> productList = [];

  @override
  void initState() {
    super.initState();
    isloading = true;
    productListingRepo.listing().then((value) {
      setState(() {
        isloading = false;
      });
      if(value!=null)
      {
        setState(() {
          productList = value;
          print(productList.length);
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
                 /* Container(
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
                  ),*/
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
            /*Container(
              margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2.25),
              child: GridView.builder(
                itemCount: getListItemsModel != null && getListItemsModel.docs!=null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0) != null && getListItemsModel.docs.elementAt(0).productDetails.length > 0? getListItemsModel.docs.elementAt(0).productDetails.length:0,
                itemBuilder: (context, index){
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical * 3)
                    ),
                    elevation: 2.0,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CachedNetworkImage(imageUrl:getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productImage.elementAt(0),
                          width: SizeConfig.screenWidth * 0.25,
                          height: SizeConfig.screenHeight * 0.1,
                        ),
                        Divider(),
                        Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productName,style: TextStyle(
                                color: Colors.black,fontSize: SizeConfig.blockSizeVertical * 1.75,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("Price \$${getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productPrice}",style: TextStyle(
                                color: Colors.grey,
                                fontSize: SizeConfig.blockSizeVertical * 1
                            ),)
                          ],),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 0.5
                          ),
                          height: SizeConfig.blockSizeVertical * 2.8,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Qty : ${getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).productPrice}",style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.bold
                              ),),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 15,
                                height: SizeConfig.blockSizeVertical * 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap:()
                  {
                    if(getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).count>0)
                      {
                        getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).count = getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).count-1;
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
                                              )
                                          ),
                                          child: Icon(Icons.remove,color: Colors.red,size: SizeConfig.blockSizeVertical * 1.5,)
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal * 1.5,
                                          right: SizeConfig.blockSizeHorizontal * 1.5
                                      ),
                                      child: Text(getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).count.toString(),style: TextStyle(
                                      ),),
                                    ),
                                    InkWell(
                                      onTap:()
                                    {
                                      getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).count=getListItemsModel.docs.elementAt(0).productDetails.elementAt(index).count+1;
                                      setState(() {

                                      });
                                    },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.green,
                                              )
                                          ),
                                          child: Icon(Icons.add,color: Colors.green,size: SizeConfig.blockSizeVertical * 1.5,)
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],),
                        ),
                      ],
                    ),
                  );                },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4/4,
                  crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                  mainAxisSpacing: SizeConfig.blockSizeVertical * 2,
                  crossAxisCount: 2,
                ),

              ),
            )*/
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
