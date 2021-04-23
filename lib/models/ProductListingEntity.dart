class ProductListingEntity {
  List<String> productImage;
  String sId;
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
  int count = 0;

  ProductListingEntity(
      {this.productImage,
        this.sId,
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
        this.iV,this.count=0});

  ProductListingEntity.fromJson(Map<String, dynamic> json) {
    productImage = json['product_image'].cast<String>();
    sId = json['_id'];
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
    count = json['count']!=null?json['count']:0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image'] = this.productImage;
    data['_id'] = this.sId;
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