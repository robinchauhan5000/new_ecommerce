class UserCreatedListEntity {
  String message;
  List<Docs> docs;
  int status;

  UserCreatedListEntity({this.message, this.docs, this.status});

  UserCreatedListEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['docs'] != null) {
      docs = new List<Docs>();
      json['docs'].forEach((v) {
        docs.add(new Docs.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Docs {
  String sId;
  String shoppingLstName;
  String totalItems;
  List<AddedProducts> addedProducts;
  String userId;
  String totalCost;
  bool deleteFlag;
  String currentTime;
  int iV;
  List<Null> userDetails;
  List<ProductDetails> productDetails;

  Docs(
      {this.sId,
        this.shoppingLstName,
        this.totalItems,
        this.addedProducts,
        this.userId,
        this.totalCost,
        this.deleteFlag,
        this.currentTime,
        this.iV,
        this.userDetails,
        this.productDetails});

  Docs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shoppingLstName = json['shoppingLstName'];
    totalItems = json['totalItems'];
    if (json['addedProducts'] != null) {
      addedProducts = new List<AddedProducts>();
      json['addedProducts'].forEach((v) {
        addedProducts.add(new AddedProducts.fromJson(v));
      });
    }
    userId = json['userId'];
    totalCost = json['totalCost'];
    deleteFlag = json['delete_flag'];
    currentTime = json['current_time'];
    iV = json['__v'];
   /* if (json['userDetails'] != null) {
      userDetails = new List<Null>();
      json['userDetails'].forEach((v) {
        userDetails.add(new Null.fromJson(v));
      });
    }*/
    if (json['ProductDetails'] != null) {
      productDetails = new List<ProductDetails>();
      json['ProductDetails'].forEach((v) {
        productDetails.add(new ProductDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['shoppingLstName'] = this.shoppingLstName;
    data['totalItems'] = this.totalItems;
    if (this.addedProducts != null) {
      data['addedProducts'] =
          this.addedProducts.map((v) => v.toJson()).toList();
    }
    data['userId'] = this.userId;
    data['totalCost'] = this.totalCost;
    data['delete_flag'] = this.deleteFlag;
    data['current_time'] = this.currentTime;
    data['__v'] = this.iV;
    /*if (this.userDetails != null) {
      data['userDetails'] = this.userDetails.map((v) => v.toJson()).toList();
    }*/
    if (this.productDetails != null) {
      data['ProductDetails'] =
          this.productDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddedProducts {
  String sId;
  String productId;
  String finalPrice;
  String finalQuantity;

  AddedProducts(
      {this.sId, this.productId, this.finalPrice, this.finalQuantity});

  AddedProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['productId'];
    finalPrice = json['final_price'];
    finalQuantity = json['final_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productId'] = this.productId;
    data['final_price'] = this.finalPrice;
    data['final_quantity'] = this.finalQuantity;
    return data;
  }
}

class ProductDetails {
  String sId;
  List<String> productImage;
  String productName;
  String productQuantity;
  String productDescription;
  String productPrice;
  String productCategory;
  String productStatus;
  String currentTime;
  String productDate;
  bool deleteFlag;
  String vendor;
  int iV;

  ProductDetails(
      {this.sId,
        this.productImage,
        this.productName,
        this.productQuantity,
        this.productDescription,
        this.productPrice,
        this.productCategory,
        this.productStatus,
        this.currentTime,
        this.productDate,
        this.deleteFlag,
        this.vendor,
        this.iV});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productImage = json['product_image'].cast<String>();
    productName = json['product_name'];
    productQuantity = json['product_quantity'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    productCategory = json['product_category'];
    productStatus = json['product_status'];
    currentTime = json['current_time'];
    productDate = json['product_date'];
    deleteFlag = json['delete_flag'];
    vendor = json['vendor'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['product_image'] = this.productImage;
    data['product_name'] = this.productName;
    data['product_quantity'] = this.productQuantity;
    data['product_description'] = this.productDescription;
    data['product_price'] = this.productPrice;
    data['product_category'] = this.productCategory;
    data['product_status'] = this.productStatus;
    data['current_time'] = this.currentTime;
    data['product_date'] = this.productDate;
    data['delete_flag'] = this.deleteFlag;
    data['vendor'] = this.vendor;
    data['__v'] = this.iV;
    return data;
  }
}