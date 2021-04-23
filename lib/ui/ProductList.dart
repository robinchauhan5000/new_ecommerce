import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/data/repo/ListDetailRepo.dart';
import 'package:flutter_ecommerce/models/ListDetail.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';

class ProductList extends StatefulWidget {
  String listId;
  ProductList({this.listId});
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var getItemsList = ListDetailRepo();
  bool isloading = false;
  var getListItemsModel = ListDetail();
  @override
  void initState() {
    super.initState();
    isloading = true;
    getItemsList.getlistdetail(listId: widget.listId).then((value) {
      setState(() {
        isloading = false;
      });
      if (value.status == 1) {
        setState(() {
          getListItemsModel = value;
          print('printing length ${getListItemsModel.docs.length}');
        });
      }
    }).catchError((onError) {
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.listId);
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    return Scaffold(
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
                            "${getListItemsModel != null && getListItemsModel.docs != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? getListItemsModel.docs.elementAt(0).productDetails.length.toString() : ""}",
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
                            "${getListItemsModel != null && getListItemsModel.docs != null && getListItemsModel.docs.length > 0 && getListItemsModel.docs.elementAt(0).productDetails.length > 0 ? getListItemsModel.docs.elementAt(0).totalCost : ""}",
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
              itemBuilder: (context, index) {
                return ListTile(
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
                    ));
              },
            ),
          )
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
