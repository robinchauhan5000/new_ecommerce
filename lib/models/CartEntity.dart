class CartEntity {
  String message;
  List<AddToCartDetails> addToCartDetails;
  List<Docs> docs;
  int status;

  CartEntity({this.message, this.addToCartDetails, this.docs, this.status});

  CartEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['addToCartDetails'] != null) {
      addToCartDetails = new List<AddToCartDetails>();
      json['addToCartDetails'].forEach((v) {
        addToCartDetails.add(new AddToCartDetails.fromJson(v));
      });
    }
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
    if (this.addToCartDetails != null) {
      data['addToCartDetails'] =
          this.addToCartDetails.map((v) => v.toJson()).toList();
    }
    if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class AddToCartDetails {
  String sId;
  String itemListId;
  String userId;
  String currentTime;
  int iV;
  List<UserDetails> userDetails;
  List<ShoppingListDetails> shoppingListDetails;

  AddToCartDetails(
      {this.sId,
        this.itemListId,
        this.userId,
        this.currentTime,
        this.iV,
        this.userDetails,
        this.shoppingListDetails});

  AddToCartDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    itemListId = json['itemListId'];
    userId = json['userId'];
    currentTime = json['current_time'];
    iV = json['__v'];
    if (json['userDetails'] != null) {
      userDetails = new List<UserDetails>();
      json['userDetails'].forEach((v) {
        userDetails.add(new UserDetails.fromJson(v));
      });
    }
    if (json['shoppingListDetails'] != null) {
      shoppingListDetails = new List<ShoppingListDetails>();
      json['shoppingListDetails'].forEach((v) {
        shoppingListDetails.add(new ShoppingListDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['itemListId'] = this.itemListId;
    data['userId'] = this.userId;
    data['current_time'] = this.currentTime;
    data['__v'] = this.iV;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails.map((v) => v.toJson()).toList();
    }
    if (this.shoppingListDetails != null) {
      data['shoppingListDetails'] =
          this.shoppingListDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  String sId;
  String userEmail;
  String userProfileImage;
  String userMobile;
  String currentTime;
  int iV;
  String userAddress;
  String userCountry;
  String userState;
  String userZipCode;
  String userName;

  UserDetails(
      {this.sId,
        this.userEmail,
        this.userProfileImage,
        this.userMobile,
        this.currentTime,
        this.iV,
        this.userAddress,
        this.userCountry,
        this.userState,
        this.userZipCode,
        this.userName});

  UserDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userEmail = json['user_email'];
    userProfileImage = json['user_profile_image'];
    userMobile = json['user_mobile'];
    currentTime = json['current_time'];
    iV = json['__v'];
    userAddress = json['user_address'];
    userCountry = json['user_country'];
    userState = json['user_state'];
    userZipCode = json['user_zip_code'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_email'] = this.userEmail;
    data['user_profile_image'] = this.userProfileImage;
    data['user_mobile'] = this.userMobile;
    data['current_time'] = this.currentTime;
    data['__v'] = this.iV;
    data['user_address'] = this.userAddress;
    data['user_country'] = this.userCountry;
    data['user_state'] = this.userState;
    data['user_zip_code'] = this.userZipCode;
    data['user_name'] = this.userName;
    return data;
  }
}

class ShoppingListDetails {
  String sId;
  String shoppingLstName;
  String totalItems;
  List<AddedProducts> addedProducts;
  String userId;
  String totalCost;
  bool deleteFlag;
  String currentTime;
  int iV;

  ShoppingListDetails(
      {this.sId,
        this.shoppingLstName,
        this.totalItems,
        this.addedProducts,
        this.userId,
        this.totalCost,
        this.deleteFlag,
        this.currentTime,
        this.iV});

  ShoppingListDetails.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class AddedProducts {
  String sId;
  String productId;
  String finalPrice;
  String finalQuantity;
  String name;
  String image;

  AddedProducts(
      {this.sId, this.productId, this.finalPrice, this.finalQuantity,this.name,this.image});

  AddedProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['productId'];
    finalPrice = json['final_price'];
    finalQuantity = json['final_quantity'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productId'] = this.productId;
    data['final_price'] = this.finalPrice;
    data['final_quantity'] = this.finalQuantity;
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
  List<UserDetails> userDetails;
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
    if (json['userDetails'] != null) {
      userDetails = new List<UserDetails>();
      json['userDetails'].forEach((v) {
        userDetails.add(new UserDetails.fromJson(v));
      });
    }
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
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails.map((v) => v.toJson()).toList();
    }
    if (this.productDetails != null) {
      data['ProductDetails'] =
          this.productDetails.map((v) => v.toJson()).toList();
    }
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